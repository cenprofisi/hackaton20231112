﻿// <auto-generated />
using System;
using Infrastructure.Persistence.Data;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Migrations;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;

#nullable disable

namespace Infrastructure.Persistence.Data.Migrations
{
    [DbContext(typeof(ApplicationContext))]
    [Migration("20231112201519_AddedLimitToGroupSchedule")]
    partial class AddedLimitToGroupSchedule
    {
        /// <inheritdoc />
        protected override void BuildTargetModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasDefaultSchema("dbo")
                .HasAnnotation("ProductVersion", "7.0.11")
                .HasAnnotation("Relational:MaxIdentifierLength", 64);

            modelBuilder.Entity("Domain.AcademicArea", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasColumnName("areaca_iCodigo");

                    b.Property<string>("Code")
                        .IsRequired()
                        .HasColumnType("VARCHAR(4)")
                        .HasColumnName("areaca_vcCodigo");

                    b.Property<bool>("IsActive")
                        .HasColumnType("tinyint(1)")
                        .HasColumnName("areaca_bActivo");

                    b.Property<string>("Name")
                        .IsRequired()
                        .HasColumnType("VARCHAR(64)")
                        .HasColumnName("areaca_vcNombre");

                    b.HasKey("Id")
                        .HasAnnotation("MySql:ValueGenerationStrategy", MySqlValueGenerationStrategy.IdentityColumn);

                    b.ToTable("area_academica", "dbo");
                });

            modelBuilder.Entity("Domain.Classroom", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasColumnName("aul_iCodigo");

                    b.Property<int>("Capacity")
                        .HasColumnType("int")
                        .HasColumnName("aul_iCapacidad");

                    b.Property<string>("Code")
                        .IsRequired()
                        .HasColumnType("VARCHAR(16)")
                        .HasColumnName("aul_vcCodigo");

                    b.Property<int>("LocationId")
                        .HasColumnType("int")
                        .HasColumnName("loc_iCodigo");

                    b.HasKey("Id")
                        .HasAnnotation("MySql:ValueGenerationStrategy", MySqlValueGenerationStrategy.IdentityColumn);

                    b.HasIndex("LocationId");

                    b.ToTable("aula", "dbo");
                });

            modelBuilder.Entity("Domain.Course", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasColumnName("cur_iCodigo");

                    b.Property<string>("Code")
                        .IsRequired()
                        .HasColumnType("VARCHAR(16)")
                        .HasColumnName("cur_vcCodigo");

                    b.Property<int>("CourseTrainingAreaId")
                        .HasColumnType("int")
                        .HasColumnName("curare_iCodigo");

                    b.Property<int>("CourseTypeId")
                        .HasColumnType("int")
                        .HasColumnName("curtip_iCodigo");

                    b.Property<decimal>("Credits")
                        .HasColumnType("DECIMAL(6,1)")
                        .HasColumnName("cur_fCreditos");

                    b.Property<string>("Name")
                        .IsRequired()
                        .HasColumnType("VARCHAR(64)")
                        .HasColumnName("cur_vcName");

                    b.Property<decimal>("RequiredCredits")
                        .HasColumnType("DECIMAL(6,1)")
                        .HasColumnName("cur_fCreditosRequisito");

                    b.Property<int>("Semester")
                        .HasColumnType("int")
                        .HasColumnName("cur_iSemestre");

                    b.Property<int>("StudyPlanId")
                        .HasColumnType("int")
                        .HasColumnName("plaest_iCodigo");

                    b.HasKey("Id")
                        .HasAnnotation("MySql:ValueGenerationStrategy", MySqlValueGenerationStrategy.IdentityColumn);

                    b.HasIndex("CourseTrainingAreaId");

                    b.HasIndex("CourseTypeId");

                    b.HasIndex("StudyPlanId");

                    b.ToTable("curso", "dbo");
                });

            modelBuilder.Entity("Domain.CourseDictationType", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasColumnName("curtip_iCodigo");

                    b.Property<string>("Name")
                        .IsRequired()
                        .HasColumnType("VARCHAR(32)")
                        .HasColumnName("curtip_vcName");

                    b.HasKey("Id")
                        .HasAnnotation("MySql:ValueGenerationStrategy", MySqlValueGenerationStrategy.IdentityColumn);

                    b.ToTable("curso_tipodictado", "dbo");
                });

            modelBuilder.Entity("Domain.CourseEquivalent", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasColumnName("cureqi_iCodigo");

                    b.Property<int>("CourseId")
                        .HasColumnType("int")
                        .HasColumnName("cur_iCodigo");

                    b.Property<int>("EquivalentId")
                        .HasColumnType("int")
                        .HasColumnName("equ_iCodigo");

                    b.HasKey("Id")
                        .HasAnnotation("MySql:ValueGenerationStrategy", MySqlValueGenerationStrategy.IdentityColumn);

                    b.HasIndex("CourseId");

                    b.ToTable("curso_equivalente", "dbo");
                });

            modelBuilder.Entity("Domain.CourseHoursDictated", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasColumnName("curhor_iCodigo");

                    b.Property<int>("CourseDictationTypeId")
                        .HasColumnType("int")
                        .HasColumnName("curtip_iCogigo");

                    b.Property<int>("CourseId")
                        .HasColumnType("int")
                        .HasColumnName("cur_iCodigo");

                    b.Property<int>("Hours")
                        .HasColumnType("int")
                        .HasColumnName("curhor_iHoras");

                    b.HasKey("Id")
                        .HasAnnotation("MySql:ValueGenerationStrategy", MySqlValueGenerationStrategy.IdentityColumn);

                    b.HasIndex("CourseDictationTypeId");

                    b.HasIndex("CourseId");

                    b.ToTable("curso_horasdictadas", "dbo");
                });

            modelBuilder.Entity("Domain.CoursePrerequisite", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasColumnName("curpre_iCodigo");

                    b.Property<int>("CourseId")
                        .HasColumnType("int")
                        .HasColumnName("cur_iCodigo");

                    b.Property<int>("PrerequisiteId")
                        .HasColumnType("int");

                    b.HasKey("Id")
                        .HasAnnotation("MySql:ValueGenerationStrategy", MySqlValueGenerationStrategy.IdentityColumn);

                    b.HasIndex("CourseId");

                    b.ToTable("curso_prerequisito", "dbo");
                });

            modelBuilder.Entity("Domain.CourseTrainingArea", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasColumnName("curare_iCodigo");

                    b.Property<string>("Name")
                        .IsRequired()
                        .HasColumnType("VARCHAR(32)")
                        .HasColumnName("curare_vcNombre");

                    b.HasKey("Id")
                        .HasAnnotation("MySql:ValueGenerationStrategy", MySqlValueGenerationStrategy.IdentityColumn);

                    b.ToTable("curso_areaformativa", "dbo");
                });

            modelBuilder.Entity("Domain.CourseType", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasColumnName("curtip_iCodigo");

                    b.Property<bool>("IsActive")
                        .HasColumnType("tinyint(1)")
                        .HasColumnName("curtip_bActivo");

                    b.Property<string>("Name")
                        .IsRequired()
                        .HasColumnType("VARCHAR(32)")
                        .HasColumnName("curtip_vcNombre");

                    b.HasKey("Id")
                        .HasAnnotation("MySql:ValueGenerationStrategy", MySqlValueGenerationStrategy.IdentityColumn);

                    b.ToTable("curso_tipo", "dbo");
                });

            modelBuilder.Entity("Domain.Day", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasColumnName("dia_iCodigo");

                    b.Property<string>("Name")
                        .IsRequired()
                        .HasColumnType("VARCHAR(16)")
                        .HasColumnName("dia_vcNombre");

                    b.Property<int>("Number")
                        .HasColumnType("int")
                        .HasColumnName("dia_iNumero");

                    b.HasKey("Id")
                        .HasAnnotation("MySql:ValueGenerationStrategy", MySqlValueGenerationStrategy.IdentityColumn);

                    b.ToTable("dia", "dbo");
                });

            modelBuilder.Entity("Domain.Faculty", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasColumnName("fac_iCodigo");

                    b.Property<string>("Code")
                        .IsRequired()
                        .HasColumnType("VARCHAR(64)")
                        .HasColumnName("fac_vcCodigo");

                    b.Property<string>("Name")
                        .IsRequired()
                        .HasColumnType("VARCHAR(64)")
                        .HasColumnName("fac_vcNombre");

                    b.HasKey("Id")
                        .HasAnnotation("MySql:ValueGenerationStrategy", MySqlValueGenerationStrategy.IdentityColumn);

                    b.ToTable("facultad", "dbo");
                });

            modelBuilder.Entity("Domain.Group", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasColumnName("gru_iCodigo");

                    b.Property<string>("Code")
                        .IsRequired()
                        .HasColumnType("longtext");

                    b.Property<int>("CourseId")
                        .HasColumnType("int")
                        .HasColumnName("cur_iCodigo");

                    b.Property<int>("Number")
                        .HasColumnType("int")
                        .HasColumnName("gru_iNumero");

                    b.Property<int>("SemesterId")
                        .HasColumnType("int")
                        .HasColumnName("sem_iCodigo");

                    b.HasKey("Id")
                        .HasAnnotation("MySql:ValueGenerationStrategy", MySqlValueGenerationStrategy.IdentityColumn);

                    b.HasIndex("CourseId");

                    b.HasIndex("SemesterId");

                    b.ToTable("grupo", "dbo");
                });

            modelBuilder.Entity("Domain.GroupSchedule", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasColumnName("gruhor_iCodigo");

                    b.Property<int>("ClassroomId")
                        .HasColumnType("int")
                        .HasColumnName("aul_iCodigo");

                    b.Property<int>("CourseDictationTypeId")
                        .HasColumnType("int")
                        .HasColumnName("curtip_iCodigo");

                    b.Property<int>("DayId")
                        .HasColumnType("int")
                        .HasColumnName("dia_iCodigo");

                    b.Property<TimeSpan>("EndTime")
                        .HasColumnType("TIME")
                        .HasColumnName("gruhor_tHoraFin");

                    b.Property<int>("GroupId")
                        .HasColumnType("int")
                        .HasColumnName("gru_iCodigo");

                    b.Property<int>("Limit")
                        .HasColumnType("int")
                        .HasColumnName("gruhor_iTope");

                    b.Property<TimeSpan>("StartTime")
                        .HasColumnType("TIME")
                        .HasColumnName("gruhor_tHoraInicio");

                    b.HasKey("Id")
                        .HasAnnotation("MySql:ValueGenerationStrategy", MySqlValueGenerationStrategy.IdentityColumn);

                    b.HasIndex("ClassroomId");

                    b.HasIndex("CourseDictationTypeId");

                    b.HasIndex("DayId");

                    b.HasIndex("GroupId");

                    b.ToTable("grupo_horario", "dbo");
                });

            modelBuilder.Entity("Domain.Location", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasColumnName("loc_iCodigo");

                    b.Property<string>("Code")
                        .IsRequired()
                        .HasColumnType("VARCHAR(16)")
                        .HasColumnName("loc_vcCodigo");

                    b.Property<string>("Name")
                        .IsRequired()
                        .HasColumnType("VARCHAR(64)")
                        .HasColumnName("loc_vcNombre");

                    b.HasKey("Id")
                        .HasAnnotation("MySql:ValueGenerationStrategy", MySqlValueGenerationStrategy.IdentityColumn);

                    b.ToTable("locales", "dbo");
                });

            modelBuilder.Entity("Domain.School", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasColumnName("esc_iCodigo");

                    b.Property<int>("AcademicAreaId")
                        .HasColumnType("int")
                        .HasColumnName("areaca_iCodigo");

                    b.Property<string>("Code")
                        .IsRequired()
                        .HasColumnType("VARCHAR(16)")
                        .HasColumnName("esc_vcCodigo");

                    b.Property<int>("FacultyId")
                        .HasColumnType("int")
                        .HasColumnName("fac_iCodigo");

                    b.Property<bool>("IsActive")
                        .HasColumnType("tinyint(1)")
                        .HasColumnName("esc_bActive");

                    b.Property<string>("Name")
                        .IsRequired()
                        .HasColumnType("VARCHAR(64)")
                        .HasColumnName("esc_vcNombre");

                    b.HasKey("Id")
                        .HasAnnotation("MySql:ValueGenerationStrategy", MySqlValueGenerationStrategy.IdentityColumn);

                    b.HasIndex("AcademicAreaId");

                    b.HasIndex("FacultyId");

                    b.ToTable("escuela", "dbo");
                });

            modelBuilder.Entity("Domain.Semester", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasColumnName("sem_iCodigo");

                    b.Property<string>("Code")
                        .IsRequired()
                        .HasColumnType("VARCHAR(8)")
                        .HasColumnName("sem_vcCodigo");

                    b.Property<bool>("IsActive")
                        .HasColumnType("tinyint(1)")
                        .HasColumnName("sem_bActive");

                    b.HasKey("Id")
                        .HasAnnotation("MySql:ValueGenerationStrategy", MySqlValueGenerationStrategy.IdentityColumn);

                    b.ToTable("semestre", "dbo");
                });

            modelBuilder.Entity("Domain.StudyPlan", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasColumnName("plaest_iCodigo");

                    b.Property<string>("Code")
                        .IsRequired()
                        .HasColumnType("VARCHAR(8)")
                        .HasColumnName("plaest_vcCodigo");

                    b.Property<int>("Credits")
                        .HasColumnType("int")
                        .HasColumnName("plaest_iCreditos");

                    b.Property<bool>("IsActive")
                        .HasColumnType("tinyint(1)")
                        .HasColumnName("plaest_bActivo");

                    b.Property<string>("RR")
                        .IsRequired()
                        .HasColumnType("VARCHAR(16)")
                        .HasColumnName("plaest_vcRR");

                    b.Property<int>("SchoolId")
                        .HasColumnType("int");

                    b.Property<DateTime>("Vigency")
                        .HasColumnType("datetime(6)")
                        .HasColumnName("plaest_dVigencia");

                    b.HasKey("Id")
                        .HasAnnotation("MySql:ValueGenerationStrategy", MySqlValueGenerationStrategy.IdentityColumn);

                    b.HasIndex("SchoolId");

                    b.ToTable("plan_estudios", "dbo");
                });

            modelBuilder.Entity("Domain.Classroom", b =>
                {
                    b.HasOne("Domain.Location", "Location")
                        .WithMany("Classrooms")
                        .HasForeignKey("LocationId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("Location");
                });

            modelBuilder.Entity("Domain.Course", b =>
                {
                    b.HasOne("Domain.CourseTrainingArea", "CourseTrainingArea")
                        .WithMany("Courses")
                        .HasForeignKey("CourseTrainingAreaId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("Domain.CourseType", "CourseType")
                        .WithMany("Courses")
                        .HasForeignKey("CourseTypeId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("Domain.StudyPlan", "StudyPlan")
                        .WithMany("Courses")
                        .HasForeignKey("StudyPlanId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("CourseTrainingArea");

                    b.Navigation("CourseType");

                    b.Navigation("StudyPlan");
                });

            modelBuilder.Entity("Domain.CourseEquivalent", b =>
                {
                    b.HasOne("Domain.Course", "Course")
                        .WithMany("CourseEquivalents")
                        .HasForeignKey("CourseId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("Course");
                });

            modelBuilder.Entity("Domain.CourseHoursDictated", b =>
                {
                    b.HasOne("Domain.CourseDictationType", "CourseDictationType")
                        .WithMany("CourseHoursDictateds")
                        .HasForeignKey("CourseDictationTypeId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("Domain.Course", "Course")
                        .WithMany("CourseHoursDictateds")
                        .HasForeignKey("CourseId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("Course");

                    b.Navigation("CourseDictationType");
                });

            modelBuilder.Entity("Domain.CoursePrerequisite", b =>
                {
                    b.HasOne("Domain.Course", "Course")
                        .WithMany("CoursePrerequisites")
                        .HasForeignKey("CourseId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("Course");
                });

            modelBuilder.Entity("Domain.Group", b =>
                {
                    b.HasOne("Domain.Course", "Course")
                        .WithMany("Groups")
                        .HasForeignKey("CourseId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("Domain.Semester", "Semester")
                        .WithMany("Groups")
                        .HasForeignKey("SemesterId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("Course");

                    b.Navigation("Semester");
                });

            modelBuilder.Entity("Domain.GroupSchedule", b =>
                {
                    b.HasOne("Domain.Classroom", "Classroom")
                        .WithMany("GroupSchedules")
                        .HasForeignKey("ClassroomId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("Domain.CourseDictationType", "CourseDictationType")
                        .WithMany("GroupSchedules")
                        .HasForeignKey("CourseDictationTypeId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("Domain.Day", "Day")
                        .WithMany("GroupSchedules")
                        .HasForeignKey("DayId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("Domain.Group", "Group")
                        .WithMany("GroupSchedules")
                        .HasForeignKey("GroupId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("Classroom");

                    b.Navigation("CourseDictationType");

                    b.Navigation("Day");

                    b.Navigation("Group");
                });

            modelBuilder.Entity("Domain.School", b =>
                {
                    b.HasOne("Domain.AcademicArea", "AcademicArea")
                        .WithMany("Schools")
                        .HasForeignKey("AcademicAreaId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("Domain.Faculty", "Faculty")
                        .WithMany("Schools")
                        .HasForeignKey("FacultyId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("AcademicArea");

                    b.Navigation("Faculty");
                });

            modelBuilder.Entity("Domain.StudyPlan", b =>
                {
                    b.HasOne("Domain.School", "School")
                        .WithMany("StudyPlans")
                        .HasForeignKey("SchoolId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("School");
                });

            modelBuilder.Entity("Domain.AcademicArea", b =>
                {
                    b.Navigation("Schools");
                });

            modelBuilder.Entity("Domain.Classroom", b =>
                {
                    b.Navigation("GroupSchedules");
                });

            modelBuilder.Entity("Domain.Course", b =>
                {
                    b.Navigation("CourseEquivalents");

                    b.Navigation("CourseHoursDictateds");

                    b.Navigation("CoursePrerequisites");

                    b.Navigation("Groups");
                });

            modelBuilder.Entity("Domain.CourseDictationType", b =>
                {
                    b.Navigation("CourseHoursDictateds");

                    b.Navigation("GroupSchedules");
                });

            modelBuilder.Entity("Domain.CourseTrainingArea", b =>
                {
                    b.Navigation("Courses");
                });

            modelBuilder.Entity("Domain.CourseType", b =>
                {
                    b.Navigation("Courses");
                });

            modelBuilder.Entity("Domain.Day", b =>
                {
                    b.Navigation("GroupSchedules");
                });

            modelBuilder.Entity("Domain.Faculty", b =>
                {
                    b.Navigation("Schools");
                });

            modelBuilder.Entity("Domain.Group", b =>
                {
                    b.Navigation("GroupSchedules");
                });

            modelBuilder.Entity("Domain.Location", b =>
                {
                    b.Navigation("Classrooms");
                });

            modelBuilder.Entity("Domain.School", b =>
                {
                    b.Navigation("StudyPlans");
                });

            modelBuilder.Entity("Domain.Semester", b =>
                {
                    b.Navigation("Groups");
                });

            modelBuilder.Entity("Domain.StudyPlan", b =>
                {
                    b.Navigation("Courses");
                });
#pragma warning restore 612, 618
        }
    }
}
