# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lpolizzi <lpolizzi@student.42nice.fr>      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/10/07 20:18:29 by lpolizzi          #+#    #+#              #
#    Updated: 2024/11/04 11:42:08 by lpolizzi         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

COMP = cc
CFLAGS = -Wall -Wextra -Werror -I ./
NAME = libft.a
ADDIDIR = additional
LIBCDIR = libc
BONUSDIR = bonus

LIBCFILE =  ft_atoi					ft_bzero					ft_isalnum				ft_isalpha			\
	    	ft_isascii				ft_isdigit					ft_isprint				ft_memchr			\
	    	ft_memcmp				ft_memcpy					ft_memmove				ft_memset			\
	    	ft_strchr				ft_strdup					ft_strlcat				ft_strlcpy			\
	    	ft_strlen				ft_strncmp					ft_strnstr				ft_strrchr			\
	    	ft_tolower				ft_toupper					ft_calloc

ADDIFILE =  ft_strjoin				ft_substr					ft_strtrim				ft_split			\
	  		ft_itoa					ft_strmapi					ft_striteri				ft_putchar_fd		\
	    	ft_putstr_fd			ft_putendl_fd				ft_putnbr_fd

BONUSFILE = ft_lstnew_bonus			ft_lstadd_front_bonus		ft_lstsize_bonus		ft_lstlast_bonus	\
			ft_lstadd_back_bonus	ft_lstdelone_bonus			ft_lstclear_bonus		ft_lstiter_bonus	\
			ft_lstmap_bonus

LIBC = ${addprefix ${LIBCDIR}/, ${addsuffix .c, ${LIBCFILE}}}
ADDI = ${addprefix ${ADDIDIR}/, ${addsuffix .c, ${ADDIFILE}}}
BONUS = ${addprefix ${BONUSDIR}/, ${addsuffix .c, ${BONUSFILE}}}

SRCS = ${LIBC} ${ADDI}
SRCS_BONUS = ${SRCS} ${BONUS}

OBJS = ${SRCS:.c=.o}
OBJS_BONUS = ${SRCS_BONUS:.c=.o}

all: ${NAME}

${NAME}: ${OBJS}
						ar rcs ${NAME} ${OBJS}

bonus: ${OBJS_BONUS}
						ar rcs ${NAME} ${OBJS_BONUS}

.c.o:
						${COMP} ${CFLAGS} -c $< -o $@

clean:
						rm -rf ${OBJS} ${OBJS_BONUS}

fclean: clean
						rm -rf ${NAME}

re: fclean all

rebonus: fclean bonus

.PHONY: all clean fclean re rebonus
