public class CreateNewTask {
    public static Task createNewTaskFromAccount(Account acc) {
        Task t = new Task();
        t.Subject = 'Consumidor Final';
        t.WhatId = acc.Id;
        t.Status = 'Not Started';
        t.Priority = 'Normal';
        return t;
    }
}
