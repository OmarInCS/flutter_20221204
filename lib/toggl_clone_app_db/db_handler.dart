

import 'package:app20221204/toggl_clone_app_db/models/project.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHandler {

  Future<Database> initDB() async {
    var folderPath = await getDatabasesPath();
    var dbPath = join(folderPath, "toggl.db");

    return openDatabase(
      dbPath,
      version: 1,
      onCreate: (db, version) async {

        await db.execute("""
            Create TABLE projects 
            (
              projectId integer PRIMARY KEY AUTOINCREMENT,
              projectName varchar(30) NOT NULL,
              clientName varchar(30),
              hourRate integer DEFAULT 0
            );
        """);

        await db.execute("""
          CREATE TABLE time_entries
            (
              entryId integer PRIMARY KEY AUTOINCREMENT,
              startTime text NOT NULL,
              description text NOT NULL,
              endTime text,
              projectId integer REFERENCES projects(projectId)
            );
        """);

        await db.rawInsert("""
        INSERT INTO projects (projectname, clientname, hourrate)
            VALUES ('Toggl x Clone', 'Omar Karem', 100);
        """);

        await db.rawInsert("""
        INSERT INTO projects (projectname, clientname, hourrate)
            VALUES ('Stock Market Analyzer', 'Majid Alhamzah', 150);
  
        """);

        await db.rawInsert("""
        INSERT INTO projects (projectname, clientname, hourrate)
            VALUES ('Scratch Clone', 'Fay', 150);
        """);

        await db.rawInsert("""
        INSERT INTO time_entries (starttime, description, endtime, projectid)
            values ('2021-08-16 01:00', 'Do First Task', '2021-08-16 02:30', 1);
        """);

        await db.rawInsert("""
        INSERT INTO time_entries (starttime, description, endtime, projectid)
            values ('2021-08-16 07:00', 'Do First Task', '2021-08-16 09:30', 2);

        """);

        await db.rawInsert("""
        INSERT INTO time_entries (starttime, description, endtime, projectid)
            values ('2021-08-17 01:00', 'Do Second Task', '2021-08-17 03:30', 1);

        """);

        await db.rawInsert("""
        INSERT INTO time_entries (starttime, description, endtime, projectid)
            values ('2021-08-15 14:00', 'Do First Task', '2021-08-15 18:30', 3);
        """);

      },

    );
  }


  Future<List<Project>> getAllProjects() async {
    var db = await initDB();
    List<Map<String, dynamic>> projects = await db.query("projects");
    return [for (var pMap in projects) Project.fromMap(pMap)];
  }

}