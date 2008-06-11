/*##############################################################################
#This file is part of Dedomenon.
#
#Dedomenon is free software: you can redistribute it and/or modify
#it under the terms of the GNU Affero General Public License as published by
#the Free Software Foundation, either version 3 of the License, or
#(at your option) any later version.
#
#Dedomenon is distributed in the hope that it will be useful,
#but WITHOUT ANY WARRANTY; without even the implied warranty of
#MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#GNU Affero General Public License for more details.
#
#You should have received a copy of the GNU Affero General Public License
#along with Dedomenon.  If not, see <http://www.gnu.org/licenses/>.
#
#Copyright 2008 Raphaël Bauduin
##############################################################################*/

CREATE TABLE users (
  id int NOT NULL auto_increment,
  login varchar(80) default NULL,
  password varchar(40) default NULL,
  email varchar(60) default NULL,
  firstname varchar(40) default NULL,
  lastname varchar(40) default NULL,
  uuid char(32) default NULL,
  salt char(32) default NULL,
  verified INT default 0,
  created_at DATETIME default NULL,
  updated_at DATETIME default NULL,
  logged_in_at DATETIME default NULL,
  PRIMARY KEY (id)
);
