#---VAR--------------------------
NAME			= inception

#---FILES------------------------
SRCS			=	srcs/

REQ				=	$(addprefix $(SRCS),requirements/)

NGINX			=	$(addprefix $(REQ),nginx/)
MARIADB			=	$(addprefix $(REQ),mariadb/)
WORDPRESS		=	$(addprefix $(REQ),wordpress/)

COMPOSE			= docker compose -f $(SRCS)docker-compose.yml -p $(NAME)
RM				=	rm -rf
MKDIR			= mkdir -p

#---RULES----------------------
all: build

build:
	$(MAKE) volumes
	$(COMPOSE) build 

volumes:
	$(MKDIR) /home/leo/data/wordpress
	$(MKDIR) /home/leo/data/mariadb

destroy:
	$(COMPOSE) destroy --rmi all -v --remove-orphans

clean:
	$(MAKE) destroy

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
