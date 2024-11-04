/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_strjoin.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: lpolizzi <lpolizzi@student.42nice.fr>      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/10/10 22:38:07 by lpolizzi          #+#    #+#             */
/*   Updated: 2024/10/24 22:05:48 by lpolizzi         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

char	*ft_strjoin(const char *s1, const char *s2)
{
	char	*ret;
	int		i;
	int		j;
	const char *empty;

	empty = "";
	i = -1;
	j = 0;
	if (!s1)
		s1 = empty;
	if (!s2)
		s2 = empty;
	ret = malloc(sizeof(char) * (ft_strlen((char *)s1) + ft_strlen((char *)s2)
				+ 1));
	if (!ret)
		return (NULL);
	while (s1[++i])
		ret[i] = s1[i];
	while (s2[j])
		ret[i++] = s2[j++];
	ret[i] = '\0';
	return (ret);
}
