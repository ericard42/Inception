HOME_IN	=	/home/ericard/data
NAME	=	Inception
VOLUMES	=	srcs_db srcs_wp-data

$(NAME): all

all:	
	mkdir -p $(HOME_IN)/wp-data
	mkdir -p $(HOME_IN)/db
	cp /etc/hosts /etc/hosts.old
	cp srcs/my_hosts /etc/hosts
	docker-compose -f srcs/docker-compose.yml build
	docker-compose -f srcs/docker-compose.yml up

clean:
	docker-compose -f srcs/docker-compose.yml down
	docker system prune -a

fclean:	clean
	docker volume rm $(VOLUMES)
	rm -rf $(HOME_IN)/wp-data
	rm -rf $(HOME_IN)/db
	mv /etc/hosts.old /etc/hosts

re: fclean all

.PHONY: all, clean, fclean, re
