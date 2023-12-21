CREATE SCHEMA IF NOT EXISTS hoje_e_onde;
USE hoje_e_onde;

CREATE TABLE IF NOT EXISTS usuario(
    id_usuario integer auto_increment,
    nome varchar(30) not null,
    user_img varchar(255),
    sobrenome varchar(50) not null,
    data_nasc date not null,
    email varchar(150) not null,
    senha varchar(255) not null,
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
('Thiago' , 'https://i.imgur.com/mS3vdHx.jpg' ,'Barbosa', '2000-07-01', 'thiagobarbosa@gmail.com', 'thiago123', 2),
('Levi', 'https://i.imgur.com/sEuYH5G.jpg', 'Renato', '2000-07-31', 'levirenato@gmail.com', 'levi123', 2),
('Josino' , 'https://i.imgur.com/HbVvjmg.jpg' , 'Rodrigues', '1985-10-15', 'josinon@gmail.com', 'josinon123', 2),
('Ana', 'https://i.imgur.com/QqJ05s6.jpg' ,'Silva', '1990-05-14', 'anasilva@gmail.com', 'ana123', 1),
('Bruno', 'https://i.imgur.com/mAXgJGp.jpg',  'Costa', '1985-06-20', 'brunocosta@gmail.com', 'bruno123', 3),
('Carla',  'https://i.imgur.com/moTeMd5.jpg' , 'Dias', '1992-07-30', 'carladias@gmail.com', 'carla123', 2),
('Diego', 'https://i.imgur.com/2FceCoT.jpg' , 'Santos', '1988-08-15', 'diegosantos@gmail.com', 'diego123', 1),
('Eduardo' , 'https://i.imgur.com/SVA1O1Y.jpg' , 'Oliveira', '1991-09-05', 'eduardooliveira@gmail.com', 'eduardo123', 3),
('Fernanda', 'https://i.imgur.com/74H94nF.jpg' , 'Pereira', '1989-10-25', 'fernandapereira@gmail.com', 'fernanda123', 2),
('Matheus','https://i.imgur.com/HjGq3Y8.jpg' , 'Vinicius', '2002-08-30', 'matheusvinicius@gmail.com', 'matheus123', 2),
('Helena' , 'https://i.imgur.com/74CpuoN.jpg' , 'Lima', '1999-12-20', 'helenalima@gmail.com', 'helena123', 3),
('João', 'https://i.imgur.com/YG4ux99.jpg' ,'Campos', '1993-11-26', 'joaocampo@gmail.com', 'joao123', 2),
('Julia','https://i.imgur.com/5jAvaVG.jpg' ,'Barros', '1950-02-15', 'juliabarros@gmail.com', 'julia123', 1),
('Lucas','https://i.imgur.com/QmY9VXH.jpg' , 'Cardoso', '2001-03-05', 'lucascardoso@gmail.com', 'lucas123', 3),
('Mariana','https://i.imgur.com/hEfMzDl.jpg', 'Ribeiro', '1998-04-25', 'marianaribeiro@gmail.com', 'mariana123', 2),
('Nelson' , 'https://i.imgur.com/bQe8jDP.jpg' , 'Martins', '1993-05-10', 'nelsonmartins@gmail.com', 'nelson123', 1);

INSERT INTO categoria(titulo) 
VALUES 
('cultura'), 
('tecnologia'), 
('educação'), 
('show'), 
('saúde'), 
('esportes'), 
('governo');

INSERT INTO eventos(nome_evento,descricao,endereco_evento, status_evento, data_evento, curtida, imagem_evento, id_usuario, id_categoria) 
VALUES 
('Show de Rap', 'show massa de rap','Recife', 1, '2024-01-15', 0, 'https://i.imgur.com/WYgVreP.jpg', 2,(SELECT id_categoria FROM categoria WHERE titulo = 'show')),
('Show de Funk', 'show massa de Funk','Jaboatão dos Guararapes',1, '2024-02-20', 0, 'https://i.imgur.com/bCwK5Sf.jpg', 2,(SELECT id_categoria FROM categoria WHERE titulo = 'show')),
('Festival de Jazz', 'Um evento incrível de jazz ao ar livre', 'Olinda', 1, '2024-03-10', 0, 'https://i.imgur.com/hhy77PH.jpg', 1, (SELECT id_categoria FROM categoria WHERE titulo = 'cultura')),
('Feira de Tecnologia', 'Veja as últimas inovações tecnológicas', 'Paulista', 1, '2024-04-15', 0, 'https://i.imgur.com/Nqvj14N.jpg', 3, (SELECT id_categoria FROM categoria WHERE titulo = 'tecnologia')),
('Aula de Fotografia', 'Aprenda técnicas avançadas de fotografia', 'Cabo de Santo Agostinho', 1, '2024-05-20', 0, 'https://i.imgur.com/qeWxU6y.jpg', 4, (SELECT id_categoria FROM categoria WHERE titulo = 'educação')),
('Exposição de Arte Contemporânea', 'Descubra a arte moderna em uma exposição única', 'Recife', 1, '2024-06-25', 0, 'https://i.imgur.com/6oasI5C.jpg', 6, (SELECT id_categoria FROM categoria WHERE titulo = 'cultura')),
('Corrida de saco', 'Participe da corrida e promova a saúde', 'Jaboatão dos Guararapes', 1, '2024-07-30', 0, 'https://i.imgur.com/NfmwnF7.jpg', 8, (SELECT id_categoria FROM categoria WHERE titulo = 'esportes')),
('Seminário de Marketing Digital', 'Explore as estratégias mais recentes de marketing digital', 'Ipojuca', 1, '2024-08-05', 0, 'https://i.imgur.com/jSyOuKn.jpg', 9, (SELECT id_categoria FROM categoria WHERE titulo = 'governo')),
('Feira de Saúde', 'Descubra maneiras de manter uma vida saudável', 'Camaragibe', 1, '2024-09-10', 0, 'https://i.imgur.com/NcEIftz.jpg', 11, (SELECT id_categoria FROM categoria WHERE titulo = 'saúde')),
('Workshop de Desenvolvimento Pessoal', 'Aprimore suas habilidades pessoais e profissionais', 'São Lourenço da Mata', 1, '2024-10-15', 0, 'https://i.imgur.com/6xDJDtv.jpg', 12, (SELECT id_categoria FROM categoria WHERE titulo = 'governo')),
('Competição de Surf', 'Assista aos melhores surfistas em ação', 'Igarassu', 1, '2024-11-20', 0, 'https://i.imgur.com/Ad1CQat.jpg', 14, (SELECT id_categoria FROM categoria WHERE titulo = 'esportes')),
('Feira de Inovação', 'Conheça as últimas inovações em tecnologia e negócios', 'Abreu e Lima', 1, '2024-12-25', 0, 'https://i.imgur.com/i5qDQGK.png', 16, (SELECT id_categoria FROM categoria WHERE titulo = 'tecnologia')),
('Vestibular 2024 Unibra ', 'Oportunidades para cursar sua faculdade dos sonhos em 2024!', 'Recife', 1, '2024-02-01', 5, 'https://i.imgur.com/uzTg83I.jpg', 16, (SELECT id_categoria FROM categoria WHERE titulo = 'educação')),
('Festival de Cinema Independente', 'Celebração do cinema independente de todo o mundo', 'Recife', 1, '2024-05-20', 1, 'https://i.imgur.com/Uy0Hfle.jpg', 2, (SELECT id_categoria FROM categoria WHERE titulo = 'cultura')),
('Exposição de Arte Moderna', 'Exposição apresentando obras de artistas modernos locais', 'Olinda', 1, '2024-06-15', 1, 'https://i.imgur.com/BhqDT4A.jpg', 3, (SELECT id_categoria FROM categoria WHERE titulo = 'cultura')),
('XIV Bienal Internacional do Livro de Pernambuco', 'Feira de livros com autores locais e internacionais', 'Olinda', 1, '2024-07-10', 0, 'https://i.imgur.com/OVUd9jq.jpg', 1, (SELECT id_categoria FROM categoria WHERE titulo = 'cultura')),
('Festival de Teatro', 'Festival celebrando o teatro local e internacional', 'Jaboatão dos Guararapes', 1, '2024-08-05', 0, 'https://i.imgur.com/dqHrRpQ.jpg', 2, (SELECT id_categoria FROM categoria WHERE titulo = 'cultura')),
('Noite de Poesia', 'Noite dedicada à poesia e literatura', 'Recife', 1, '2024-09-01', 0, 'https://i.imgur.com/Cls4zDY.jpg', 3, (SELECT id_categoria FROM categoria WHERE titulo = 'cultura')),
('Conferência de Inteligência Artificial', 'Conferência sobre as últimas tendências em IA', 'Recife', 1, '2024-10-20', 0, 'https://i.imgur.com/b58Cbgu.jpg', 1, (SELECT id_categoria FROM categoria WHERE titulo = 'tecnologia')),
('Hackathon de Programação', 'Evento de programação de 24 horas', 'Olinda', 1, '2024-11-15', 0, 'https://i.imgur.com/YggakzC.jpg', 2, (SELECT id_categoria FROM categoria WHERE titulo = 'tecnologia')),
('Exposição de Robótica', 'Exposição apresentando as últimas inovações em robótica', 'Paulista', 1, '2024-12-10', 0, 'https://i.imgur.com/YcRScjn.jpg', 3, (SELECT id_categoria FROM categoria WHERE titulo = 'tecnologia')),
('Simpósio de Segurança Cibernética', 'Simpósio sobre as últimas tendências e desafios em segurança cibernética', 'Jaboatão dos Guararapes', 1, '2025-01-05', 0, 'https://i.imgur.com/PvLsAUP.jpg', 1, (SELECT id_categoria FROM categoria WHERE titulo = 'tecnologia')),
('Feira de Startups', 'Feira apresentando startups locais e suas inovações', 'Recife', 1, '2025-02-01', 0, 'https://i.imgur.com/JhvkDhR.jpg', 2, (SELECT id_categoria FROM categoria WHERE titulo = 'tecnologia')),
('Concerto de Música Clássica', 'Concerto apresentando peças clássicas populares', 'Recife', 1, '2025-08-20', 0, 'https://i.imgur.com/7Oqg8nc.png', 1, (SELECT id_categoria FROM categoria WHERE titulo = 'show')),
('Festival de Música Pop', 'Festival apresentando artistas pop locais e internacionais', 'Olinda', 1, '2025-09-15', 0, 'https://i.imgur.com/fPkxWFp.png', 2, (SELECT id_categoria FROM categoria WHERE titulo = 'show')),
('Show de Stand-up Comedy', 'Show de comédia stand-up com comediantes locais', 'Paulista', 1, '2025-10-10', 0, 'https://i.imgur.com/Ea9WMss.png', 3, (SELECT id_categoria FROM categoria WHERE titulo = 'show')),
('Show de Sertanejo', 'Show de Sertanejo com diversas atrações', 'Jaboatão dos Guararapes', 1, '2025-11-05', 0, 'https://i.imgur.com/b3hoRrm.jpg', 1, (SELECT id_categoria FROM categoria WHERE titulo = 'show')),
('Show de Mágica', 'Show de mágica para todas as idades', 'Recife', 1, '2025-12-01', 0, 'https://i.imgur.com/SoSPIWt.jpg', 2, (SELECT id_categoria FROM categoria WHERE titulo = 'show')),
('Maratona da Cidade', 'Maratona anual com percursos de diferentes distâncias', 'Recife', 1, '2026-01-20', 0, 'https://i.imgur.com/zU7QHoK.jpg', 2, (SELECT id_categoria FROM categoria WHERE titulo = 'esportes')),
('Torneio de Futebol Juvenil', 'Torneio de futebol para jovens atletas locais', 'Olinda', 1, '2026-02-15', 0, 'https://i.imgur.com/aePPYLI.jpg', 3, (SELECT id_categoria FROM categoria WHERE titulo = 'esportes')),
('Campeonato de Skate', 'Campeonato de skate para todas as idades', 'Paulista', 1, '2026-03-10', 0, 'https://i.imgur.com/Pa6G73e.jpg', 1, (SELECT id_categoria FROM categoria WHERE titulo = 'esportes')),
('Aula de Yoga ao Ar Livre', 'Aula de yoga gratuita em um parque local', 'Jaboatão dos Guararapes', 1, '2026-04-05', 0, 'https://i.imgur.com/nM6MtkJ.jpg', 2, (SELECT id_categoria FROM categoria WHERE titulo = 'esportes')),
('Clínica de Basquete', 'Clínica de habilidades de basquete para jovens jogadores', 'Recife', 1, '2026-05-01', 0, 'https://i.imgur.com/hLxCSmT.jpg', 3, (SELECT id_categoria FROM categoria WHERE titulo = 'esportes')),
('Reunião do Conselho da Cidade', 'Reunião pública do conselho da cidade para discutir questões locais', 'Recife', 1, '2026-06-20', 0, 'https://i.imgur.com/649k5q5.jpg', 1, (SELECT id_categoria FROM categoria WHERE titulo = 'governo')),
('Workshop de Preparação para Desastres', 'Workshop sobre como se preparar para desastres naturais', 'Olinda', 1, '2026-07-15', 0, 'https://i.imgur.com/suPmfYu.jpg', 2, (SELECT id_categoria FROM categoria WHERE titulo = 'governo')),
('Feira de Empregos do Governo', 'Feira de empregos apresentando oportunidades de emprego no governo local', 'Paulista', 1, '2026-08-10', 0, 'https://i.imgur.com/2dhYJfQ.jpg', 3, (SELECT id_categoria FROM categoria WHERE titulo = 'governo')),
('Dia de Limpeza da Comunidade', 'Evento de voluntariado para limpar parques e espaços públicos locais', 'Jaboatão dos Guararapes', 1, '2026-09-05', 0, 'https://i.imgur.com/IzWlpyq.jpg', 1, (SELECT id_categoria FROM categoria WHERE titulo = 'governo')),
('Fórum de Políticas Públicas', 'Fórum para discutir políticas públicas e questões comunitárias', 'Recife', 1, '2026-10-01', 0, 'https://i.imgur.com/pB7LVk6.jpg', 2, (SELECT id_categoria FROM categoria WHERE titulo = 'governo')),
('Feira de Saúde Comunitária', 'Feira de saúde oferecendo exames de saúde gratuitos e informações de bem-estar', 'Recife', 1, '2026-11-20', 0, 'https://i.imgur.com/eUn5YNF.jpg', 1, (SELECT id_categoria FROM categoria WHERE titulo = 'saúde')),
('Workshop de Nutrição', 'Workshop sobre alimentação saudável e nutrição', 'Olinda', 1, '2026-12-15', 0, 'https://i.imgur.com/uyuSU5D.jpg', 2, (SELECT id_categoria FROM categoria WHERE titulo = 'saúde')),
('Aula de Fitness ao Ar Livre', 'Aula de fitness gratuita em um parque local', 'Paulista', 1, '2027-01-10', 0, 'https://i.imgur.com/RaHKg9u.jpg', 3, (SELECT id_categoria FROM categoria WHERE titulo = 'saúde')),
('Palestra de Saúde Mental', 'Palestra sobre a importância da saúde mental e recursos disponíveis', 'Jaboatão dos Guararapes', 1, '2027-02-05', 0, 'https://i.imgur.com/hOf09e2.jpg', 1, (SELECT id_categoria FROM categoria WHERE titulo = 'saúde')),
('Campanha de Vacinação', 'Evento de vacinação para a comunidade', 'Recife', 1, '2027-03-01', 0, 'https://i.imgur.com/6XBjkE4.jpg', 2, (SELECT id_categoria FROM categoria WHERE titulo = 'saúde'));
