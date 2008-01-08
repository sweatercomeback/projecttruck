CREATE TABLE `coming_soons` (
  `id` int(11) NOT NULL auto_increment,
  `email` varchar(255) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `messages` (
  `id` int(11) NOT NULL auto_increment,
  `subject` varchar(255) default NULL,
  `body` text,
  `user_id` int(11) default NULL,
  `from_user_id` int(11) default NULL,
  `unread` tinyint(1) default '1',
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

CREATE TABLE `nav_links` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL,
  `link_controller` varchar(255) NOT NULL,
  `link_action` varchar(255) default NULL,
  `controller` varchar(255) default NULL,
  `action` varchar(255) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `news_items` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(255) default NULL,
  `summary` varchar(255) default NULL,
  `article` text,
  `active` tinyint(1) default '1',
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `photos` (
  `id` int(11) NOT NULL auto_increment,
  `content_type` varchar(255) default NULL,
  `filename` varchar(255) default NULL,
  `size` int(11) default NULL,
  `parent_id` int(11) default NULL,
  `thumbnail` varchar(255) default NULL,
  `width` int(11) default NULL,
  `height` int(11) default NULL,
  `db_file_id` int(11) default NULL,
  `user_id` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

CREATE TABLE `photos_projects` (
  `id` int(11) NOT NULL auto_increment,
  `photo_id` int(11) default NULL,
  `project_id` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `photos_vehicles` (
  `id` int(11) NOT NULL auto_increment,
  `photo_id` int(11) default NULL,
  `vehicle_id` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

CREATE TABLE `project_steps` (
  `id` int(11) NOT NULL auto_increment,
  `project_id` int(11) default NULL,
  `text` varchar(255) default NULL,
  `photo_id` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

CREATE TABLE `projects` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(255) default NULL,
  `vehicle_id` int(11) default NULL,
  `project_photo_id` int(11) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

CREATE TABLE `schema_info` (
  `version` int(11) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE `service_log_types` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

CREATE TABLE `service_logs` (
  `id` int(11) NOT NULL auto_increment,
  `service_log_type_id` int(11) default NULL,
  `vehicle_id` int(11) default NULL,
  `comments` varchar(255) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `mileage` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `users` (
  `id` int(11) NOT NULL auto_increment,
  `login` varchar(255) default NULL,
  `hashed_password` varchar(255) default NULL,
  `email` varchar(255) default NULL,
  `salt` varchar(255) default NULL,
  `created_at` datetime default NULL,
  `lat` double default NULL,
  `lng` double default NULL,
  `last_activity_date` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

CREATE TABLE `vehicle_attributes` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `type` varchar(255) default NULL,
  `parent_id` int(11) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=latin1;

CREATE TABLE `vehicles` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(255) default NULL,
  `model_other` varchar(255) default NULL,
  `year` int(11) default NULL,
  `mileage` int(11) default NULL,
  `engine_comments` text,
  `drive_comments` text,
  `transmission_comments` text,
  `doors` int(11) default NULL,
  `ext_color_comments` text,
  `int_color_comments` text,
  `vehicle_condition_comments` text,
  `street_legal` tinyint(1) default NULL,
  `additional_comments` text,
  `active` tinyint(1) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `zipcode` varchar(255) default NULL,
  `city` varchar(255) default NULL,
  `price` float default NULL,
  `for_sale` tinyint(1) default NULL,
  `model_id` int(11) default NULL,
  `engine_id` int(11) default NULL,
  `drive_id` int(11) default NULL,
  `transmission_id` int(11) default NULL,
  `vehicle_condition_id` int(11) default NULL,
  `user_id` int(11) default NULL,
  `lat` double default NULL,
  `lng` double default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

INSERT INTO `schema_info` (version) VALUES (33)