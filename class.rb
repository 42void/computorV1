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

class Licorne
	attr_accessor :puissance, :number, :signe
	def initialize(signe, number, puissance)
		@signe = signe
		@number = number.to_f
		@puissance = puissance.to_i
	end

	def to_s
		number = @number
		if number < 0
			number = -(number)
		end
		if number.modulo(1).zero?
			number = number.to_i
		end
		"#{@signe} #{number} * X^#{@puissance}"
	end
end
