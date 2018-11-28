<!-- $theme: gaia -->

# TSQL Benchmarking and SQL Server Toolkit

Konstantin Taranov k@taranov.pro

https://github/ktaranov/sqlcom2018

https://t.me/ktaranov

---
## TSQL Benchmarking
Benchmark tools for SQL Server: [HammerDB](http://www.hammerdb.com/), [RML Utilities for SQL Server](https://www.microsoft.com/en-us/download/details.aspx), [SQLStress](https://github.com/ErikEJ/SqlQueryStress), [Dell Benchmark Factory](https://www.quest.com/products/benchmark-factory)

[How to Benchmark Alternative SQL Queries to Find the Fastest Query](https://blog.jooq.org/2017/03/29/how-to-benchmark-alternative-sql-queries-to-find-the-fastest-query/) by Luka Seder

TSQL is not best programming language:
 - no packages
 - No indexed loop - only WHILE loop
 - No implicit cursor loops (instead: DEALLOCATE!)...

---
## sp_BenchmarkTSQL
https://github.com/ktaranov/sqlserver-kit/blob/master/Stored_Procedure/sp_BenchmarkTSQL.sql

 - [Name Convention](https://github.com/ktaranov/sqlserver-kit/blob/master/SQL%20Server%20Name%20Convention%20and%20T-SQL%20Programming%20Style.md)
 - `CREATE AND ALTER` instead `DROP AND CREATE`
 - Self documented in powershell style
 - `RAISERROR` instead `PRINT`
 - License [MIT](https://github.com/ktaranov/sqlserver-kit/blob/master/LICENSE)


---
## SQL Server Tools and Utilities
https://github.com/ktaranov/sqlserver-kit/tree/master/Utilities
List of 275 SQL Server paid and free Utilities and Tools

* [Docs Overview SQL Tools](https://docs.microsoft.com/en-us/sql/tools/overview-sql-tools)
* [Azure Data Studio](https://github.com/Microsoft/azuredatastudio)
* [DataGrip](https://www.jetbrains.com/datagrip/)
* [PlanExploer](https://www.sentryone.com/plan-explorer)


---
## Total Commander
https://www.ghisler.com/
  - Incredible Search
  - Hot keys
  - Rename files
  - Compare directories

---
## Autohotkey
The ultimate automation scripting language for Windows
https://www.autohotkey.com/

 - Autotype option
 - Always on top `^SPACE::  Winset, Alwaysontop, , A`
 - Complex solution
 - Convert text: `Ctrl+Win+L`, `Ctrl+Win+U`, `SHIFT+CTL+K`

---
## EmEditor
https://www.emeditor.com/
EmEditor is a fast, lightweight, yet extensible, easy-to-use text editor for Windows.

 - LARGE FILE SUPPORT (Easily handle files up to 248 GB)
 - Compare Documents
 - Regular Expressions
 - Awesome csv support


---
## SSMS
* [SSMS Version](https://github.com/ktaranov/sqlserver-kit/tree/master/SSMS)
* [SSMS Addins](https://github.com/ktaranov/sqlserver-kit/blob/master/SSMS/SSMS_Addins.md) (ApexSQL Search, SSMS Boost and 31 more)
* [SSMS Tips](https://github.com/ktaranov/sqlserver-kit/blob/master/SSMS/SSMS_Tips.md)
* [SSMS Alternatives](https://github.com/ktaranov/sqlserver-kit/blob/master/Utilities/SSMS_Alternatives.md)
* [SSMS Book](http://ssmsbook.sqldownunder.com/) (by SDU)


---
## SDU Tools
https://sqldownunder.com/pages/sdu-tools
Tools for comparing databases, tables, finding unused indexes, manipulating strings, performance tuning, converting data, and so much more on pure TSQL.

* DATABASE AND TABLE COMPARISON TOOLS
* GENERAL FUNCTIONS
* DATABASE UTILITIES
* SCRIPTING FUNCTIONS
* DATA CONVERSION FUNCTIONS...


---
## SQL Server must reading list: beginning level
* [Как работает реляционная БД](https://habr.com/company/mailru/blog/266811/) by Дмитрий Калугин-Балашов
* [Understanding how SQL Server executes a query](http://rusanu.com/2013/08/01/understanding-how-sql-server-executes-a-query/) by Remus Rusanu
* [Slow in the Application, Fast in SSMS?](http://www.sommarskog.se/query-plan-mysteries.html) by Erland Sommarskog ([Russian version](http://www.queryprocessor.ru/fast-in-ssms-slow-in-app-part1/) by Dmitry Pilugin)
* [The Curse and Blessings of Dynamic SQL](http://sommarskog.se/dynamic_sql.html) by Erland Sommarskog


---
## SQL Server must reading list: advanced level
* Pilugin blogs: http://www.queryprocessor.ru/ and http://www.queryprocessor.com/
* Bren Ozar blog ([Batch Mode For Row Store: What Does It Help With?](https://www.brentozar.com/archive/2018/10/batch-mode-for-row-store-what-does-it-help-with/) and https://youtu.be/KfdfNRrIsU0)
* [Niko Neugebauer](http://www.nikoport.com/columnstore/) - master of Columnstore indexes
* [SQLShack](https://www.sqlshack.com/)


---
## SQL Server must reading list: expert level
* [My web resources](https://github.com/ktaranov/sqlserver-kit#sql-server-web-resources)
* [Brent Ozar Feedly list](https://github.com/BrentOzar/sqlblogs)


---
## SQL Server Trace Flags, Latch and Waits libraries
Detailed list of documented and undocumented Microsoft SQL Server trace flags (**593 trace flags**)
https://github.com/ktaranov/sqlserver-kit/blob/master/SQL%20Server%20Trace%20Flag.md

* ⚠ Warning!
* Scope: global, session or query 
* Use “-T” option for global flags
* Undocumented flags
* Recommended flags

[SQL Server Latch Classes Library](https://www.sqlskills.com/help/latches/) (by Paul S. Randal)
[SQL Server Wait Types Library](https://www.sqlskills.com/help/waits/) (by Paul S. Randal)


---
## sp_WhoIsActive

http://whoisactive.com/docs/

sp_whoisactive is a comprehensive activity monitoring stored procedure that works for all versions of SQL Server from 2005 through 2017.

 - [How to Log Activity Using sp_whoisactive](https://www.brentozar.com/responder/log-sp_whoisactive-to-a-table/)
 - [Logging Activity Using sp_WhoIsActive – Take 2](https://www.brentozar.com/archive/2016/07/logging-activity-using-sp_whoisactive-take-2/)
 - **"-" NOT FULLY OPEN SOURCE**


---
## Brent Ozar SQL Server First Responder Kit
https://github.com/BrentOzarULTD/SQL-Server-First-Responder-Kit

#### NO COMMENTS - YOU MUST USE THIS Stored Procedures (especially [sp_BlitzInMemoryOLTP](https://github.com/BrentOzarULTD/SQL-Server-First-Responder-Kit/blob/dev/sp_BlitzInMemoryOLTP.sql)) 



---
## SQL Server Ola Hallengren's Maintenance Solution 
https://github.com/olahallengren/sql-server-maintenance-solution
SQL Server Backup, Integrity Check, and Index and Statistics Maintenance

Alternative:
* [Minion Backup](http://www.minionware.net/products/backup/)
* [Minion CheckDB](http://www.minionware.net/products/checkdb/)
* [Minion Index Maintenance](http://www.minionware.net/products/reindex/)


---
## Powershell and SQL Server
https://github.com/ktaranov/sqlserver-kit#powershell-and-sql-server

* [dbatools](https://github.com/sqlcollaborative/dbatools)
* [SQLPSX](https://www.red-gate.com/simple-talk/sql/database-administration/what-is-sqlpsx/)
* [ReportingServicesTools - Reporting Services Powershell Tools](https://github.com/ktaranov/ReportingServicesTools)
* [PowerUpSQL - A PowerShell Toolkit for Attacking SQL Server](https://github.com/NetSPI/PowerUpSQL)

Spoon of tar: most modules do not support Powershell 6 (no cross platform) and no good IDE.


---
## How to ask help
Lazy method: https://t.me/sqlcom or https://t.me/sql_ninja

1. Create question on stackoverflow
Include:
* Operation system with detailed version (Windows, Ubuntu, Macos etc.). 
* Relation database type (SQL Server preferred, Orcale, MySQL, PostgreSQL, SQLite etc.) with detailed version.
* Demo script (if necessary) to reproduce your problem.
2.Distribute your question using this channels:
    1. [Twitter #sqlhelp](https://twitter.com/search?q=%23sqlhelp&src=tyah) with `#sqlhelp` hash tag
    2. [Slack #sqlhelp](https://sqlcommunity.slack.com/messages/sqlhelp/) (more than 700 People)
    3. [SQLServerCentral Forum](https://www.sqlservercentral.com/Forums/)
    4. Telegram chat (Russian preferred): https://t.me/sqlcom
    5. [SQL.ru](https://www.sql.ru/)


---
## LeaRn Python and R

* Build in from SQL Server 2016 (R) and SQL Server 2017 (Python)
* Awesome community
* Libraires (R) and packages (Python) for solving any problem
* Open source (FREE) and cross platform
* [ML BIGDATA HADOOP Jirachi](http://www.lookatme.ru/mag/live/experience-news/218263-pokemon) ...


---
## Start own open source project or contribute
https://github.com/ktaranov/github-stump
1. Create account on **[Github](https://github.com/join)** or [Gitlab](https://gitlab.com/users/sign_in) or [Bitbucket](https://bitbucket.org/account/signup/) (if you also need free private repo)
2. [Install GIT](https://git-scm.com/downloads)
3. [Install GIT GUI Client](https://git-scm.com/downloads/guis). For Windows i recommend [Git Extensions](https://gitextensions.github.io/),  for Mac [GitKraken](https://www.gitkraken.com/)


---
## Thanks to
* to all of you
* Dmitriy Zaicev
* Lestat
* Brent Ozar
* ~~Paup Randal~~ Dmitriy Pilugin
* ~~Dima Pilugin~~ Paul Randal
* Satya Nadella
* and [all SQL Server awesome Community](https://github.com/ktaranov/sqlserver-kit/blob/master/SQL%20Server%20People.md)