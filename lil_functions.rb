# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    computor.rb                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: avanhoeg <avanhoeg@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2015/10/12 19:39:55 by avanhoeg          #+#    #+#              #
#    Updated: 2015/10/13 20:47:36 by avanhoeg         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

def my_sqrt(x)
	prev = 0
	k = 0
	kmax = 1000
	s = 1
	for k in (0...kmax) do
		prev = s
		s = (s + x/s)/2
		if(prev == s)
			break
		end
	end
	return s
end

def delta(a, b , c)
	delta = (b * b) - 4 * (a * c)
	return delta
end

def positive_delta_first_solution(a, b, c, delta)
	solution1 = (-b + my_sqrt(delta)) / (2 * a)
	return solution1
end

def positive_delta_second_solution(a, b, c, delta)
	solution2 = (-b - my_sqrt(delta)) / (2 * a)
	return solution2
end

def zero_delta(a, b, c)
	solution = -b / (2 * a)
	return solution
end

def solution_first_degree(d, e)
	if d != 0
		return -(e/d)
	end
	if d == 0 && e != 0
		return "\033[47m\033[34mL'equation n'admet aucune solution\033[0m\033[0m"
	end
	if d == 0 && e == 0
		return "\033[47m\033[34mL'equation admet comme solution l'ensemble des nombres reels\033[0m\033[0m"
	end
end
