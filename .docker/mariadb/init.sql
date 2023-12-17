CREATE SCHEMA IF NOT EXISTS hoje_e_onde;
USE hoje_e_onde;

CREATE TABLE IF NOT EXISTS usuario(
    id_usuario integer auto_increment,
    nome varchar(30) not null,
    user_img varchar(255),
    sobrenome varchar(50) not null,
    data_nasc date not null,
    email varchar(150) not null,
    senha varchar(50) not null,
    nivel_usuario integer not null,
    PRIMARY KEY (id_usuario),
    UNIQUE (email)
);

CREATE TABLE IF NOT EXISTS categoria(
    id_categoria integer not null auto_increment,
    titulo varchar(100) not null, 
    descricao varchar(255) null,
    PRIMARY KEY(id_categoria)
);

CREATE TABLE IF NOT EXISTS eventos(
    id_evento INTEGER AUTO_INCREMENT,
    nome_evento varchar(100) not null,
    endereco_evento varchar(255) not null,
    descricao varchar(255) null,
    status_evento integer not null,
    data_evento date not null,
    curtida integer null,
    imagem_evento varchar(255),
    id_usuario integer,
    id_categoria integer,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
    FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria),
    PRIMARY KEY (id_evento)
);
INSERT INTO usuario(nome, user_img ,sobrenome, data_nasc, email, senha, nivel_usuario) 
VALUES
('Thiago' , 'https://p2.trrsf.com/image/fget/cf/774/0/images.terra.com/2023/09/11/1161338360-raposa-do-artico-pequena.jpg' ,'Barbosa', '2000-07-01', 'thiagobarbosa@gmail.com', 'thiago123', 1),
('Levi', 'https://static.nationalgeographicbrasil.com/files/styles/image_3200/public/01-animals-social-distancing-nationalgeographic_110344.jpg', 'Renato', '2000-07-31', 'levirenato@gmail.com', 'levi123', 2),
('Josino' , 'https://media.licdn.com/dms/image/C4D03AQHoSjA-vPRknQ/profile-displayphoto-shrink_800_800/0/1526469874162?e=2147483647&v=beta&t=XPbsjFnx8tIFwNvcnXmz7DTCLrTZ9idlZdHoxbcZeyc' , 'Rodrigues', '1987-08-25', 'josinon@gmail.com', 'josinon123', 2),
('Ana', '' ,'Silva', '1990-05-14', 'anasilva@gmail.com', 'ana123', 1),
('Bruno', '',  'Costa', '1985-06-20', 'brunocosta@gmail.com', 'bruno123', 3),
('Carla',  '' , 'Dias', '1992-07-30', 'carladias@gmail.com', 'carla123', 2),
('Diego', '' , 'Santos', '1988-08-15', 'diegosantos@gmail.com', 'diego123', 1),
('Eduardo' , '' , 'Oliveira', '1991-09-05', 'eduardooliveira@gmail.com', 'eduardo123', 3),
('Fernanda', '' , 'Pereira', '1989-10-25', 'fernandapereira@gmail.com', 'fernanda123', 2),
('Gabriel ','' , 'Rocha', '1993-11-10', 'gabrielrocha@gmail.com', 'gabriel123', 1),
('Helena' , '' , 'Lima', '1999-12-20', 'helenalima@gmail.com', 'helena123', 3),
('Igor', '' ,'Mendes', '1995-01-30', 'igormendes@gmail.com', 'igor123', 2),
('Julia','' ,'Barros', '2002-02-15', 'juliabarros@gmail.com', 'julia123', 1),
('Lucas','' , 'Cardoso', '2001-03-05', 'lucascardoso@gmail.com', 'lucas123', 3),
('Mariana','', 'Ribeiro', '1998-04-25', 'marianaribeiro@gmail.com', 'mariana123', 2),
('Nelson' , '' , 'Martins', '1999-05-10', 'nelsonmartins@gmail.com', 'nelson123', 1);

INSERT INTO categoria(titulo) 
VALUES 
('cultura'), 
('tecnologia'), 
('educação'), 
('show'), 
('saúde'), 
('esportes'), 
('profissional'), 
('inovação');

INSERT INTO eventos(nome_evento,endereco_evento, descricao, status_evento, data_evento, curtida, imagem_evento, id_usuario, id_categoria) 
VALUES 
('Show de Rap', 'show massa de rap','Recife', 1, '2024-01-15', NULL, 'https://i.imgur.com/WYgVreP.jpg', 2,(SELECT id_categoria FROM categoria WHERE titulo = 'show')),
('Show de Funk', 'show massa de Funk','Jaboatão dos Guararapes',1, '2024-02-20', NULL, 'https://i.imgur.com/bCwK5Sf.jpg', 2,(SELECT id_categoria FROM categoria WHERE titulo = 'show'));
