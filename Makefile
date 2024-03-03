NAME		=	inception
SRCS		=	srcs/
NGINX		=	srcs/requirements/nginx/
MARIADB		=	srcs/requirements/mariadb/
WORDPRESS	=	srcs/requirements/wordpress/

V_DB		=	/home/llevasse/data/mariadb/
V_WP		=	/home/llevasse/data/wordpress/

COMPOSE		= docker-compose -f $(SRCS)docker-compose.yml -p $(NAME)
RM			= rm -rf
MKDIR		= mkdir -p





all: up

up:
	$(MAKE) volumes
	$(COMPOSE) up -d --build

volumes:
	$(MKDIR) $(V_WP)
	$(MKDIR) $(V_DB)

stop:	#will not have to download anything on 'make up'
	$(COMPOSE) down

down:	#will have to download almost everything on 'make up'
	$(COMPOSE) down --rmi all -v --remove-orphans

clean:
	$(MAKE) down

fclean:
	$(MAKE) clean
	$(RM) $(V_WP)*
	$(RM) $(V_DB)*

prune:
	$(MAKE) fclean
	docker system prune -f -a --volumes

re:
	$(MAKE) fclean
	$(MAKE) all

.PHONY: all up down start restart stop clean fclean prune re
