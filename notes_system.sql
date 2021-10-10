DROP DATABASE IF EXISTS notes_system;
CREATE DATABASE notes_system;
USE notes_system;

drop table if exists `users`;
create table users(
`id` int(10) unsigned unique auto_increment not null,
`first_name` varchar(50) not null,
`last_name` varchar(50) not null,
`email` varchar(50) not null,
primary key (`id`));

drop table if exists `notes`;
create table notes(
`id` int(10) unsigned unique auto_increment not null,
`title` varchar(100) not null,
`creation_date` timestamp null default null,
`last_modified` timestamp null default null,
`description` varchar(200) not null,
`can_delete` tinyint(1) not null,
`user_id` int(10) unsigned,
primary key (`id`),
foreign key(`user_id`) references `users`(`id`));

drop table if exists `categories`;
create table categories(
`id` int(10) unsigned unique auto_increment not null,
`name` varchar(50) not null,
primary key (`id`));

drop table if exists `note_category`;
create table note_category(
`id` int(10) unsigned unique auto_increment not null,
`id_category` int(10) unsigned,
`id_note` int(10) unsigned not null,
primary key(`id`),
foreign key(`id_note`) references `notes`(`id`),
foreign key(`id_category`) references `categories`(`id`));

insert into `users` values (1, 'Fernando', 'Juarez', 'fernando@email.com'), (2, 'Maria', 'Fuentes', 'maria@email.com'),
(3,'Aldo', 'Rodriguez', 'aldo@email.com'), (4,'Diana', 'Montes', 'diana@email.com'),
(5,'Luis', 'Martinez', 'luis@email.com'), (6,'Monica', 'Aquino', 'monica@email.com'),
(7,'Jose', 'Lopez', 'jose@email.com'), (8,'Veronica', 'Sanchez', 'veronica@email.com'),
(9,'Sebastian', 'Quintana', 'sebastian@email.com'), (10,'Daniela', 'Gomez', 'daniela@email.com');

insert into `categories` values(1,'Comedia'), (2,'Social'), (3,'Tecnolog?a'), (4,'Deportes'),
(5,'Vida sana'), (6,'Educacion'), (7,'Cultura'), (8,'Musica'),(9, 'Turismo'), (10,'Entretenimiento');

insert into `notes` values (1, 'Partido de futbol', null, null, 'Partido de futbol sabado por la noche', 1, 2),
(2, 'Pizza gigante', null, null, ' Comer pizza gigante en el centro', 0, 5),
(3, 'Practicar concierto', null, null, 'Practicar canciones para concierto', 1, 1),
(4, 'Redmi 11', null, null, 'Comprar celular en oferta', 0, 1),
(5, 'Escuchar podcast', null, null, 'Escuchar nuevo cap?tulo del podcast', 0, 9),
(6, 'Venom', null, null, 'Ir al cine a ver la nueva pel?cula de Venom', 1, 10),
(7, 'Tomar agua', null, null, 'Tomar dos litros de agua', 0, 3),
(8, 'Ex?menes m?dicos', null, null, 'Asistir a los ex?menes m?dicos', 1, 4),
(9, 'Visitar familiares', null, null, 'Visitar familiares en Guanajuato', 0, 6),
(10, 'Modulo Playground', null, null, 'Tomar siguiente modulo en Playground', 1, 8);

insert into `note_category` values (1,4,1), (2,10,1), (3,10,2), (4,8,3), (5,2,3), (6,3,4),(7,10,5), (8,6,5),
(9,10,6), (10,5,7), (11,5,8), (12,9,9), (13,6,10);








