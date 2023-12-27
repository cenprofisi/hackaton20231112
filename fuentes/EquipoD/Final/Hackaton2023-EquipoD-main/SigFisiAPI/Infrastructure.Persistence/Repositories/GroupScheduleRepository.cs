using Application.Repositories;
using Domain;
using Infrastructure.Persistence.Data;
using Microsoft.EntityFrameworkCore;

namespace Infrastructure.Persistence.Repositories;

public class GroupScheduleRepository : GenericRepository<GroupSchedule>, IGroupScheduleRepository
{
    public GroupScheduleRepository(ApplicationContext context) : base(context)
    {
    }

    public override async Task<GroupSchedule?> GetByIdAsync(int id)
    {
        return await DbSet.Include(x => x.Group)
            .FirstOrDefaultAsync(x => x.Id == id);
    }

    public async Task<IEnumerable<GroupSchedule>> SearchGroupSchedule(int? groupNumber = null, int? semester = null,
        int? studyPlanId = null)
    {
        var groupsSchedule = DbSet.Where(x =>
                x.Group.Number == groupNumber && x.Group.Course.Semester == semester &&
                x.Group.Course.StudyPlanId == studyPlanId)
            .Include(x => x.CourseDictationType)
            .Include(x => x.Day)
            .Include(x => x.Classroom)
            .Include(x => x.Group)
            .ThenInclude(x => x.Course)
            .AsQueryable();

        if (groupNumber != null)
        {
            groupsSchedule = groupsSchedule.Where(x => x.Group.Number == groupNumber);
        }

        if (semester != null)
        {
            groupsSchedule = groupsSchedule.Where(x => x.Group.Course.Semester == semester);
        }

        if (studyPlanId != null)
        {
            groupsSchedule = groupsSchedule.Where(x => x.Group.Course.StudyPlanId == studyPlanId);
        }

        return await groupsSchedule.ToListAsync();
    }

    public async Task<IEnumerable<GroupSchedule>> GetUnavailableSchedulesAsync(int groupNumber, int semester)
    {
        return await DbSet.Include(x => x.Group)
            .ThenInclude(x => x.Course)
            .Include(x => x.Day)
            .Include(x => x.Classroom)
            .Where(x => x.Group.Number == groupNumber && x.Group.Course.Semester == semester)
            .ToListAsync();
    }

    public async Task<IEnumerable<GroupSchedule>> GetUnavailableSchedulesByDayAsync(int groupNumber, int semester,
        int dayId)
    {
        return (await GetUnavailableSchedulesAsync(groupNumber, semester)).Where(x => x.DayId == dayId);
    }

    public async Task<IEnumerable<GroupSchedule>> GetSchedulesWithoutClassroom()
    {
        return await DbSet.Include(x => x.Group)
            .ThenInclude(x => x.Course)
            .Include(x => x.CourseDictationType)
            .Include(x => x.Day)
            .Where(x => x.ClassroomId == null)
            .ToListAsync();
    }

    public override async Task<IEnumerable<GroupSchedule>> GetAllAsync()
    {
        return await DbSet.Include(x => x.Group)
            .ThenInclude(x => x.Course)
            .Include(x => x.CourseDictationType)
            .Include(x => x.Classroom)
            .ToListAsync();
    }
}