WITH routineTasks as 
(SELECT id, date_int, location_id, status_cd, created_datetime, task_id, look_task_id FROM th_ontrack_ot04test.task.v_location_routine_tasks where due_datetime between '2019-07-17 00:00:00' and '2019-07-17 23:55:00' and action_cd='LOG' and status_cd='A'),
managerTasks as 
(select task.look_task.id from task.look_task WHERE task.look_task.owner_cd ='MANAGER_IN_CHARGE' )
SELECT userData.username, userData.home_location_id  ,routineTasks.look_task_id, routineTasks.task_id  FROM usr.security_user AS userData

LEFT JOIN  routineTasks  ON routineTasks.location_id=userData.home_location_id 
LEFT JOIN managerTasks on managerTasks.id = routineTasks.look_task_id


