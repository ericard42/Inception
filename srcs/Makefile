HOME_IN	=	/home/ericard/data
NAME	=	Inception
VOLUMES	=	srcs_db srcs_wp-data

$(NAME): all

all:	
	mkdir -p $(HOME_IN)/wp-data
	mkdir -p $(HOME_IN)/db
	docker-compose build
	docker-compose up

clean:
	docker-compose down
	docker system prune -a

fclean:	clean
	docker volume rm $(VOLUMES)
	rm -rf $(HOME_IN)/wp-data
	rm -rf $(HOME_IN)/db

re: fclean all

.PHONY: all, clean, fclean, re
