create table if not exists operation_type
(
    id   int auto_increment primary key,
    name varchar(255) not null
);

insert into operation_type (name)
values ('sale'),
       ('purchase'),
       ('refund');

create table if not exists operation_status
(
    id   int auto_increment primary key,
    name varchar(255) not null
);

insert into operation_status (name)
values ('pending'),
       ('in_process'),
       ('approved'),
       ('rejected'),
       ('canceled');

create table if not exists operation
(
    id               bigint auto_increment primary key,
    type_id          int      not null,
    status_id        int      not null,
    created_at       datetime not null,
    updated_at       datetime not null,
    shopping_cart_id bigint   not null,
    constraint operation_type_id_status_id_fk foreign key (type_id) references operation_type (id),
    constraint operation_status_id_status_id_fk foreign key (status_id) references operation_status (id)
);

create table if not exists operation_detail
(
    id           bigint auto_increment primary key,
    operation_id bigint         not null,
    product_id   varchar(255)   not null,
    quantity     int            not null,
    price        decimal(10, 2) not null,
    constraint operation_detail_operation_id_product_id_fk foreign key (operation_id) references operation (id)
);

create table if not exists operation_transition
(
    id             bigint auto_increment primary key,
    operation_id   bigint not null,
    from_status_id int    not null,
    to_status_id   int    not null,
    constraint operation_transition_operation_id_from_status_id_fk foreign key (operation_id) references operation (id),
    constraint operation_transition_from_status_id_to_status_id_fk foreign key (from_status_id) references operation_status (id),
    constraint operation_transition_to_status_id_to_status_id_fk foreign key (to_status_id) references operation_status (id)
);
