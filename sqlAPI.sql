create table icons
(
    id    int auto_increment
        primary key,
    size  int          not null,
    asset varchar(100) not null
);

create table `lines`
(
    id          int auto_increment
        primary key,
    number      varchar(5)   not null,
    description varchar(255) not null
);

create table point_type
(
    id   int auto_increment
        primary key,
    type varchar(100) not null
);

create table points
(
    id            int auto_increment
        primary key,
    marker_id     varchar(10)  not null,
    latitude      double       not null,
    longitude     double       not null,
    title         varchar(100) not null,
    snippets      varchar(255) not null,
    id_icon       int          not null,
    id_point_type int          not null,
    constraint MARKERS_marker_id_uindex
        unique (marker_id),
    constraint icon_of_point_fk
        foreign key (id_icon) references icons (id),
    constraint point_type_of_points___fk
        foreign key (id_point_type) references point_type (id)
);

create table points_lines
(
    id_point int not null,
    id_line  int not null,
    constraint line_of_points_lines___fk
        foreign key (id_line) references `lines` (id),
    constraint point_of_points_lines___fk
        foreign key (id_point) references points (id)
);

create table routes
(
    id        int auto_increment
        primary key,
    latitude  double not null,
    longitude double not null,
    `order`   int    not null,
    id_line   int    not null,
    constraint line_of_routes___fk
        foreign key (id_line) references `lines` (id)
);

create table user
(
    id             int auto_increment
        primary key,
    is_connected   tinyint(1) default 0 not null,
    last_connect   date                 not null,
    longitude      double               not null,
    latitude       double               not null,
    waiting_a_line int                  null,
    leave_the_line int                  null,
    enter_the_line int                  null,
    posible_line   int                  null,
    confirmed_line int                  null,
    is_traveling   tinyint(1) default 0 null,
    constraint confirmed_line_of_user___fk
        foreign key (confirmed_line) references `lines` (id),
    constraint enter_the_line_of_user___fk
        foreign key (enter_the_line) references points (id),
    constraint leave_the_line_of_user___fk
        foreign key (leave_the_line) references points (id),
    constraint posible_line_of_user___fk
        foreign key (posible_line) references `lines` (id),
    constraint waiting_a_line_of_user_position___fk
        foreign key (waiting_a_line) references `lines` (id)
);

create table history_user_line
(
    id               int auto_increment
        primary key,
    id_user          int                                     not null,
    id_line          int                                     not null,
    boarding         int                                     not null,
    landing          int                                     not null,
    date             date                                    not null,
    time_of_landing  timestamp default '0000-00-00 00:00:00' not null,
    time_of_boarding timestamp default '0000-00-00 00:00:00' not null on update CURRENT_TIMESTAMP,
    travels_time     time                                    not null,
    constraint boarding_of_history_user_line___fk
        foreign key (boarding) references points (id),
    constraint landing_of_history_user_line___fk
        foreign key (landing) references points (id),
    constraint line_of_history_user_line___fk
        foreign key (id_line) references `lines` (id),
    constraint user_of_history_user_line___fk
        foreign key (id_user) references user (id)
);

