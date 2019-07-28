CREATE TABLE Macs (
	id serial,
	mac text not null,
	primary key (id)
);

CREATE TABLE Locations (
	id int,
	location text not null,
	ts timestamp not null DEFAULT NOW(),
	primary key (id),
	foreign key (id) references Macs(id)
);

CREATE TABLE SSIDs (
	id int,
	ssid text not null,
	primary key (id),
	foreign key (id) references Macs(id)
);
