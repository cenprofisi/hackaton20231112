import styles from "./createGroupStyles.module.scss";
import axios from "../../../axios/axiosInstance";
import React, {useEffect, useState} from "react";
import MessageFacade from "../../../facades/messageFacade";
import ScheduleComponent from "./scheduleComponent";
import {useNavigate} from "react-router-dom";

export default function CreateGroupComponent() {
    const navigate = useNavigate()
    const messageMediator = new MessageFacade()
    const [planArray, setPlanArray] = useState([])
    const [coursesArray, setCoursesArray] = useState([])
    const [schedulesArray, setSchedulesArray] = useState([])
    const [groupSchedule, setGroupSchedule] = useState([])
    const [unavailableHours, setUnavailableHours] = useState([])
    const [selectedHours, setSelectedHours] = useState({
        indexes: [],
        labels: []
    })
    const [blockedHours, setBlockedHours] = useState([])
    const [groupData, setGroupData] = useState({
        planID: 'invalid',
        semesterID: 'invalid',
        courseID: 'invalid',
        limit: 'invalid',
        groupNumber: '0',
        groupSchedule: []
    })

    const handleChange = (e) => {
        const {name, value} = e.target
        setGroupData((prevState) => ({
            ...prevState,
            [name]: value
        }))

        if (name === 'courseID' && value !== 'invalid') {
            getGroupNumber(value).then(() => {
                console.log('Grupo recibido...')
            })

            clearScreen()
        }

        if (name === 'semesterID' || name === 'planID') {
            getGroupNumber(value).then(() => {
                console.log('Grupo recibido...')
            })

            clearScreen()
            setGroupData((prevState) => ({
                ...prevState,
                courseID: 'invalid',
                limit: 0,
                groupNumber: 0,
                groupSchedule: []
            }))
        }
    }

    const handleScheduleChange = async (e, duration) => {
        const {name, value} = e.target;
        const [scheduleIndex, infoType] = name.split('-');

        if (infoType === 'dayNumber') {
            setGroupSchedule((prevState) => ({
                ...prevState,
                [scheduleIndex]: {
                    ...prevState[scheduleIndex],
                    [infoType]: value,
                },
            }));
        } else {
            setGroupSchedule((prevState) => ({
                ...prevState,
                [scheduleIndex]: {
                    ...prevState[scheduleIndex],
                    [infoType]: value,
                    endTime: (parseInt(value) + duration)
                },
            }));
        }
    };

    const getPlans = async () => {
        try {
            const response = await axios.get('/api/StudyPlan/All')
            setPlanArray(response.data)
        } catch (error) {
            console.log(error)
        }
    }

    const getSchedule = async () => {
        const url = `/api/CourseHoursDictated?courseId=${groupData.courseID}`
        const url2 = `/api/GroupSchedule/GetAllUnavailable?groupNumber=${groupData.groupNumber}&semester=${groupData.semesterID}`
        const hasInvalidValue = Object.values(groupData).some((value) => value === 'invalid' || value === '0');

        if (hasInvalidValue) {
            messageMediator.showMessage(`Completa todos los campos antes de continuar...`, 'error');
            return
        }

        try {
            const response = await axios.get(url)
            setSchedulesArray(response.data)

            const unavailableResponse = await axios.get(url2)
            setUnavailableHours(unavailableResponse.data)
        } catch (error) {
            console.log(error)
        }
    };

    const getCourses = async () => {
        const url = `/api/Course/Search?studyPlanId=${groupData.planID}&semester=${groupData.semesterID}`

        try {
            const response = await axios.get(url)
            setCoursesArray(response.data)
        } catch (error) {
            console.log(error)
        }
    }

    const getGroupNumber = async (courseGetId) => {
        const url = `/api/Group/NextGroupNumber/${courseGetId}`

        try {
            const response = await axios.get(url)
            setGroupData((prevState) => ({
                ...prevState,
                'groupNumber': response.data
            }))

        } catch (error) {
            console.log(error)
        }
    }

    const clearScreen = () => {
        setGroupSchedule([])
        setSchedulesArray([])
        setSelectedHours([])
    }

    const updateSelectedHours = () => {
        let cellIndexes = [];
        let indexLabels = []

        for (const scheduleKey in groupData.groupSchedule) {
            const schedule = groupData.groupSchedule[scheduleKey];

            if (schedule.startTime !== undefined && schedule.endTime !== undefined && schedule.dayNumber !== undefined) {
                const startHour = parseInt(schedule.startTime);
                const dayNumber = parseInt(schedule.dayNumber) - 1;

                for (let i = 0; i < schedule.endTime - startHour; i++) {
                    cellIndexes.push([startHour + i - 8, dayNumber]);
                    indexLabels.push(schedulesArray[parseInt(scheduleKey) - 1].dictationTypeName)
                }
            }
        }

        setSelectedHours({
            indexes: cellIndexes,
            labels: indexLabels
        });
    };

    const updateBlockedHours = () => {
        let cellIndexes = [];

        for (const hourKey in unavailableHours) {
            const hour = unavailableHours[hourKey]

            const startHour = parseInt(hour.startTime);
            const dayNumber = parseInt(hour.dayId) - 1;

            for (let i = 0; i < hour.endTime - startHour; i++) {
                cellIndexes.push([startHour + i - 8, dayNumber]);
            }
        }

        setBlockedHours(cellIndexes)
    }

    const convertGroupData = (groupObject) => {
        const {courseID, limit, groupNumber, groupSchedule} = groupObject;

        const result = {
            courseId: courseID,
            limit: limit,
            groupNumber: groupNumber,
            groupSchedules: []
        };

        for (const key in groupSchedule) {
            const {dayNumber, startTime, endTime} = groupSchedule[key];

            result.groupSchedules.push({
                dayId: dayNumber,
                courseDictationTypeId: key,
                startTime: startTime,
                endTime: endTime
            });
        }

        return result;
    }

    const verifySelectedHours = () => {
        return selectedHours.indexes.some((hours, index) => {
            return (
                selectedHours.indexes.findIndex(
                    (otherHours, otherIndex) =>
                        index !== otherIndex && hours[0] === otherHours[0] && hours[1] === otherHours[1]
                ) !== -1
            );
        });
    };

    const createGroup = async () => {
        const bodyObject = convertGroupData(groupData)
        const url = '/api/Group'

        if (verifySelectedHours()) {
            messageMediator.showMessage('Los horarios seleccionados no son válidos...', 'error')
            return
        }

        try {
            await axios.post(url, bodyObject)
            messageMediator.showMessage('Se registro el grupo correctamente...', 'success')
            navigate('/group')
        } catch (error) {
            messageMediator.showMessage(error.response.data.Message, 'error')
        }
    }

    useEffect(() => {
        getPlans().then(() => {
            console.log('Planes recibidos...')
        })
    }, []);

    useEffect(() => {
        if (groupData.planID === 'invalid' || groupData.semesterID === 'invalid') return
        getCourses().then(() => {
            console.log('Cursos obtenidos...')
        })
    }, [groupData.planID, groupData.semesterID])

    useEffect(() => {
        updateSelectedHours()
    }, [groupData.groupSchedule])

    useEffect(() => {
        updateBlockedHours()
    }, [unavailableHours])

    useEffect(() => {
        setGroupData((prevState) => ({
            ...prevState,
            groupSchedule: groupSchedule
        }))
    }, [groupSchedule])

    const horaInicio = 8, horaFin = 22

    return (
        <div className={'componentContainer'}>
            <h1>Crear Grupo de Curso</h1>
            <div className={styles.groupDataContainer}>
                <div>
                    <label>Plan de Estudios:</label>
                    <select name={'planID'} onChange={handleChange} value={groupData.planID}>
                        <option value={'invalid'}>-- Seleccione un plan --</option>
                        {planArray.map((plan) => (
                            <option key={plan.id} value={plan.id}>{plan.code}</option>
                        ))}
                    </select>
                </div>
                <div>
                    <label>Semestre:</label>
                    <select name={'semesterID'} onChange={handleChange} value={groupData.semesterID}>
                        <option value={'invalid'}>-- Seleccione un ciclo --</option>
                        <option value={1}>Ciclo I</option>
                        <option value={2}>Ciclo II</option>
                        <option value={3}>Ciclo III</option>
                        <option value={4}>Ciclo IV</option>
                        <option value={5}>Ciclo V</option>
                        <option value={6}>Ciclo VI</option>
                        <option value={7}>Ciclo VII</option>
                        <option value={8}>Ciclo VIII</option>
                        <option value={9}>Ciclo IX</option>
                        <option value={10}>Ciclo X</option>
                    </select>
                </div>
                <div>
                    <label>Curso:</label>
                    <select name={'courseID'} onChange={handleChange} value={groupData.courseID}>
                        <option value={'invalid'}>-- Seleccione un curso --</option>
                        {coursesArray.map((course) => (
                            <option key={course.id} value={course.id}>{course.name}</option>
                        ))}
                    </select>
                </div>
                <div>
                    <label>Tope:</label>
                    <input type={'number'} min={0} max={100} placeholder={'Ingrese el tope del grupo...'}
                           name={'limit'} onChange={handleChange} value={groupData.limit}/>
                </div>
                <div>
                    <label>Número de Grupo:</label>
                    <input readOnly={true} value={groupData.groupNumber}/>
                </div>
                <button onClick={getSchedule}>Buscar horarios</button>
            </div>

            {schedulesArray.length !== 0 && (
                <div className={styles.groupScheduleContainer}>
                    <h1>Asignar Horario</h1>
                    {schedulesArray.map((schedule) => (
                        <div key={schedule.dictationTypeId} className={styles.scheduleMap}>
                            <div>
                                <label>Tipo de Dictado:</label>
                                <input type={'text'} readOnly={true} value={schedule.dictationTypeName}/>
                            </div>
                            <div>
                                <label>Horas de Dictado:</label>
                                <input type={'text'} readOnly={true} value={schedule.hours}/>
                            </div>
                            <div>
                                <label> Ingrese el día: </label>
                                <select name={`${schedule.dictationTypeId}-dayNumber`} onChange={handleScheduleChange}>
                                    <option value={'invalid'}>-- Seleccione un día --</option>
                                    <option value={'1'}>Lunes</option>
                                    <option value={'2'}>Martes</option>
                                    <option value={'3'}>Miercoles</option>
                                    <option value={'4'}>Jueves</option>
                                    <option value={'5'}>Viernes</option>
                                    <option value={'6'}>Sabado</option>
                                </select>
                            </div>
                            <div>
                                <label> Hora de inicio: </label>
                                <input type={'number'} min={horaInicio} max={horaFin - schedule.hours}
                                       defaultValue={''} name={`${schedule.dictationTypeId}-startTime`}
                                       onChange={(e) => handleScheduleChange(e, schedule.hours)}
                                       placeholder={'Ingrese la hora...'}/>
                            </div>
                            <div>
                                <label> Hora de fin: </label>
                                <input value={groupSchedule[schedule.dictationTypeId]?.endTime || ''}
                                       readOnly={true}/>
                            </div>
                        </div>
                    ))}

                    <h1>Resultado</h1>
                    <ScheduleComponent blockedHours={blockedHours} selectedObject={selectedHours}/>

                    <button type={'button'} onClick={createGroup}>Enviar</button>
                </div>
            )}
        </div>
    )
}