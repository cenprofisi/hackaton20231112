import styles from "./createGroupStyles.module.scss";
import axios from "axios";
import {useEffect, useState} from "react";
import MessageMediator from "../../../mediators/messageMediator";

export default function CreateGroupComponent() {
    const messageMediator = new MessageMediator()
    const [planArray, setPlanArray] = useState([])
    const [coursesArray, setCoursesArray] = useState([])
    const [schedulesArray, setSchedulesArray] = useState([])
    const [groupSchedule, setGroupSchedule] = useState([])
    const [availableHours, setAvailableHours] = useState([[], []])
    const [groupData, setGroupData] = useState({
        planID: 'invalid',
        semesterID: 'invalid',
        courseID: 'invalid',
        groupCapacity: 'invalid',
        groupSchedule: []
    })

    const handleChange = (e) => {
        const {name, value} = e.target
        setGroupData((prevState) => ({
            ...prevState,
            [name]: value
        }))

        console.log(groupData)
    }

    const handleScheduleChange = async (e, index) => {
        const {name, value} = e.target
        const [scheduleIndex, infoType] = name.split('-')

        if (infoType === 'dayID') {
            const newHours = getAvailableHours(value, scheduleIndex, groupData.courseID)
            setAvailableHours((prevState) => ({
                ...prevState,
                [availableHours[index]]: newHours
            }))
        }

        setGroupSchedule((prevState) => ({
            ...prevState,
            [scheduleIndex]: {
                [infoType]: value
            }
        }))
    }

    const getPlans = async () => {
        try {
            const response = await axios.get('https://sig-fisi.application.ryonadev.me/api/StudyPlan/All')
            setPlanArray(response.data)
        } catch (error) {
            console.log(error)
        }
    }

    const getSchedule = async () => {
        const hasInvalidValue = Object.values(groupData).some((value) => value === 'invalid');

        if (hasInvalidValue) {
            messageMediator.showMessage(`Completa todos los campos antes de continuar...`, 'error');
            return
        }

        try {
            const response = await axios.get(`https://sig-fisi.application.ryonadev.me/api/CourseDictationType/Search?Semester=${groupData.semesterID}&CourseId=${groupData.courseID}&StudyPlanId=${groupData.planID}`)
            setSchedulesArray(response.data)
            console.log(response.data)
        } catch (error) {
            console.log(error)
        }
    };

    const getCourses = async () => {
        const url = `https://sig-fisi.application.ryonadev.me/api/Course/Search?studyPlanId=${groupData.planID}&semester=${groupData.semesterID}`

        try {
            const response = await axios.get(url)
            setCoursesArray(response.data)
        } catch (error) {
            console.log(error)
        }
    }

    const getAvailableHours = async (dayID, tipoID, courseID) => {
        console.log(`Horas para ${dayID} ${tipoID} ${courseID}`)
        const url = ''
        try {
            const response = await axios.get(url)
            return response.data
        } catch (error) {
            console.log(error)
            return []
        }
    }

    const createGroup = () => {
        console.log(groupData)
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
        setGroupData((prevState) => ({
            ...prevState,
            groupSchedule: groupSchedule
        }))
    }, [groupSchedule])

    return (
        <div className={'componentContainer'}>
            <h1>Crear Grupo de Curso</h1>
            <div className={styles.groupDataContainer}>
                <div>
                    <label>Plan de Estudios:</label>
                    <select name={'planID'} onChange={handleChange}>
                        <option value={'invalid'}>-- Seleccione un plan --</option>
                        {planArray.map((plan) => (
                            <option key={plan.id} value={plan.id}>{plan.code}</option>
                        ))}
                    </select>
                </div>
                <div>
                    <label>Semestre:</label>
                    <select name={'semesterID'} onChange={handleChange}>
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
                    <select name={'courseID'} onChange={handleChange}>
                        <option value={'invalid'}>-- Seleccione un curso --</option>
                        {coursesArray.map((course) => (
                            <option key={course.id} value={course.id}>{course.name}</option>
                        ))}
                    </select>
                </div>
                <div>
                    <label>Tope:</label>
                    <input type={'number'} min={0} max={100} placeholder={'Ingrese el tope del grupo...'}
                           name={'groupCapacity'} onChange={handleChange}/>
                </div>
                <button onClick={getSchedule}>Buscar horarios</button>
            </div>

            {schedulesArray.length !== 0 && (
                <div className={styles.groupScheduleContainer}>
                    <h1>Asignar Horario</h1>
                    {schedulesArray.map((schedule, index) => (
                        <div key={schedule.id} className={styles.scheduleMap}>
                            <div>
                                <label>Tipo de Dictado:</label>
                                <input type={'text'} readOnly={true} value={schedule.name}/>
                            </div>
                            <div>
                                <label> Ingrese el día: </label>
                                <select name={`${schedule.id}-dayID`} onChange={(e) => handleScheduleChange(e, index)}>
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
                                <label> Ingrese la hora: </label>
                                <select name={`${schedule.id}-hour`} onChange={handleChange}>
                                    <option value={'invalid'}>-- Seleccione una hora --</option>
                                    {availableHours.length !== 0 && availableHours[index].map((hour) => (
                                        <option value={hour}>{hour}</option>
                                    ))}
                                </select>
                            </div>
                        </div>
                    ))}
                    <button onClick={createGroup}>Enviar</button>
                </div>
            )}
        </div>
    )
}