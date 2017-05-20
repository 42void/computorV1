#!/usr/bin/ruby
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

load './lil_functions.rb'
load './class.rb'
load './reduced_form.rb'
load './pol_degree_n_solutions.rb'

if ARGV[0]
	str = ARGV[0]
	false_str = str.delete(' ')
	if str == "" || false_str == ""
		puts "\033[47m\033[34mPlease enter a parameter\033[0m\033[0m"
		exit
	end
	terms = str.scan(/\s*([-|+]?\s?\d*\.?\d*\s?\*\s?X\^\d?|=)/)
	i = 0
	direction = "gauche"
	objets_g = Array.new
	objets_d = []
	while i < terms.size
		if terms[i][0] == "="
			direction = "droite"
			i += 1
			next
		end
		elem = terms[i][0].scan(/^(=)|(\+|-)?\s?(\d*\.?\d*)\s?\*\sX\^(\d*)/)[0]
		if direction == "gauche"
			objets_g << Licorne.new(elem[1], elem[2], elem[3])
		elsif direction == "droite"
			objets_d << Licorne.new(elem[1], elem[2], elem[3])
		end
		i += 1
	end

	reduced_form(objets_g, objets_d)

	if objets_g.size != 0
		pol_degree = objets_g.last.puissance
	else
		pol_degree = 0
	end

	print "\033[47m\033[34mReduced form:\033[0m\033[0m "
	a = 0
	b = 0
	c = 0
	$left_size = objets_g.size
	objets_g.each do |x|
		if x.puissance == 2
			a = x.number
			if a == 0
				objets_g.delete(x)
			end
		elsif x.puissance == 1
			b = x.number
			if b == 0
				objets_g.delete(x)
			end
		elsif x.puissance == 0
			c = x.number
			if c == 0
				objets_g.delete(x)
			end
		end

		if x.number != 0
			print x
			print " "
		elsif x.number == 0 && $left_size == 1
			print x
			print " "
		end
	end
	if objets_g.size == 0
		puts "0 = 0"
	else
		puts "= 0"
	end

	if pol_degree == -1
		pol_degree = 0
	end
	pol_degree_n_solutions(pol_degree, a, b, c)
else
	puts "\033[47m\033[34mPlease enter a parameter\033[0m\033[0m"
end
