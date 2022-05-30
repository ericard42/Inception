CREATE USER 'remote'@'localhost' IDENTIFIED BY 'MDP';
CREATE USER 'remote'@'%' IDENTIFIED BY 'MDP';

GRANT ALL ON *.* TO 'remote'@'localhost';
GRANT ALL ON *.* TO 'remote'@'%';
