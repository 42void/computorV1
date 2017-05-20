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

def pol_degree_n_solutions(pol_degree, a, b, c)
	puts "\033[47m\033[34mPolynomial degree:\033[0m\033[0m #{pol_degree}"
	if pol_degree > 3
		puts "\033[47m\033[34mThe polynomial degree is stricly greater than 2, I can't solve.\033[0m\033[0m"
		exit
	elsif pol_degree == 2
		delta = delta(a, b, c)
		if delta > 0
			sol1 = positive_delta_first_solution(a, b, c, delta)
			sol2 = positive_delta_second_solution(a, b, c, delta)
			if sol1 == sol2
				puts "\033[47m\033[34mDiscriminant is strictly positive, the solution is:\033[0m\033[0m"
			else
				puts "\033[47m\033[34mDiscriminant is strictly positive, the two solutions are:\033[0m\033[0m"
			end
			if sol1.modulo(1).zero?
				sol1 = sol1.to_i
				puts sol1
			else
				puts sol1.round(6)
			end
			if sol2.modulo(1).zero?
				sol2 = sol2.to_i
			end
			if sol2 != sol1
				if sol2.is_a? Integer
					puts sol2
				else
					puts sol2.round(6)
				end
			end
		elsif delta < 0
			x1 = (-b - 'i'.to_c * my_sqrt(-delta)) / 2 * a
			x2 = (-b + 'i'.to_c * my_sqrt(-delta)) / 2 * a
			if x1 == x2
				puts "\033[47m\033[34mDiscriminant is strictly negative, the solution is:\033[0m\033[0m"
				puts x1
			else
				puts "\033[47m\033[34mDiscriminant is strictly negative, the two solutions are:\033[0m\033[0m"
				puts x1
				puts x2
			end
		elsif delta == 0
			aw = -b / 2 * a
			puts "\033[47m\033[34mDiscriminant is equal to zero, the solution is:\033[0m\033[0m"
			if aw.modulo(1).zero?
				aw = aw.to_i
				puts aw
			else
				puts aw.round(6)
			end
		end
	elsif pol_degree == 1
		puts "\033[47m\033[34mThe solution is:\033[0m\033[0m"
		sol = solution_first_degree(b, c)
		if sol%1 == 0
			sol = sol.round
		end
		puts sol
	elsif pol_degree == 0
		if c == 0
			puts "\033[47m\033[34mL'ensemble des nombres reels sont solution\033[0m\033[0m"
		else
			puts "\033[47m\033[34mPas de solution\033[0m\033[0m"
		end
	end
end
