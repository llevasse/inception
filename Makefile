#---VAR--------------------------
NAME			= inception

#---FILES------------------------
SRCS			=	srcs/

REQ				=	$(addprefix $(SRCS),requirements/)

NGINX			=	$(addprefix $(REQ),nginx/)
MARIADB			=	$(addprefix $(REQ),mariadb/)
WORDPRESS		=	$(addprefix $(REQ),wordpress/)

COMPOSE			:= docker-compose -f $(SRCS)docker-compose.yml -p $(NAME)
RM				=	rm -rf
MKDIR			= mkdir -p

#---RULES----------------------
all: up

up:
	$(MAKE) volumes
	$(COMPOSE) up -d --build

volumes:
	$(MKDIR) /home/leo/data/wordpress
	$(MKDIR) /home/leo/data/mariadb

down:
	$(COMPOSE) down --rmi all -v --remove-orphans

clean:
	$(MAKE) down

fclean:
	$(MAKE) clean
	$(RM) /home/leo/data/wordpress/*
	$(RM) /home/leo/data/mariadb/*

prune:
	$(MAKE) fclean
	docker system prune -f -a --volumes

re :
	$(MAKE) fclean
	$(MAKE) all

.PHONY: all build destroy start restart stop clean fclean prune re
