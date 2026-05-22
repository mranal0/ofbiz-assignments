use scalar_MySql;

CREATE TABLE party_type (
    party_type_id   VARCHAR(20) primary key,
    parent_type_id  VARCHAR(20),
    has_table       TINYINT(1) DEFAULT 0,
    description     VARCHAR(255),
    
        FOREIGN KEY (parent_type_id)
		REFERENCES party_type(party_type_id)
);

CREATE TABLE party (
    party_id        VARCHAR(20) primary key,
    party_type_id   VARCHAR(20) NOT NULL,
    status_id       VARCHAR(20),
    created_date    DATETIME DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE person (
    party_id       VARCHAR(20) PRIMARY key,
    first_name     VARCHAR(100) NOT NULL,
    last_name      VARCHAR(100),

        FOREIGN KEY (party_id)
        REFERENCES party(party_id)
);


CREATE TABLE party_group (
    party_id         VARCHAR(20) primary key,
    group_name       VARCHAR(255) NOT NULL,

        FOREIGN KEY (party_id)
        REFERENCES party(party_id)
);


CREATE TABLE role_type (
    role_type_id   VARCHAR(20) primary key,
    party_role	   varchar(20) unique,
    has_table      TINYINT(1) DEFAULT 0
);


CREATE TABLE party_relationship_type (
    party_relationship_type_id VARCHAR(20) PRIMARY KEY,
    parent_type_id             VARCHAR(20),
    has_table                  TINYINT(1) DEFAULT 0,
    description                VARCHAR(255),

        FOREIGN KEY (parent_type_id)
        REFERENCES party_relationship_type(party_relationship_type_id)
);


CREATE TABLE party_relationship (
    party_id_from              VARCHAR(20) ,
    party_id_to                VARCHAR(20) ,
    role_type_id_from          VARCHAR(20) ,
    role_type_id_to            VARCHAR(20) ,
    from_date                  DATETIME,
    thru_date                  DATETIME,
    status_id                  VARCHAR(20),
    party_relationship_type_id VARCHAR(20),
    
    PRIMARY KEY (party_id_from, party_id_to, role_type_id_from, role_type_id_to, from_date),

        FOREIGN KEY (party_relationship_type_id)
        REFERENCES party_relationship_type(party_relationship_type_id),
        
	
        FOREIGN key (party_id_from, role_type_id_from)
        REFERENCES party_role(party_id, role_type_id),
        
        foreign key (party_id_to, role_type_id_to)
        REFERENCES party_role(party_id, role_type_id)
);

CREATE TABLE party_role (
    party_id     VARCHAR(20) ,
    role_type_id VARCHAR(20) ,
    
    PRIMARY KEY (party_id, role_type_id),

        FOREIGN KEY (party_id)
        REFERENCES party(party_id),

        FOREIGN KEY (role_type_id)
        REFERENCES role_type(role_type_id)
);
