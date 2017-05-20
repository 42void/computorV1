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

def	reduced_form(objets_g, objets_d)
	objets_g.each do |objetg|
		objets_d.each do |objetd|
			if objetg.puissance == objetd.puissance
				if objetg.signe == '-'
					objetg.number = -(objetg.number)
				end
				if objetd.signe == '-'
					objetd.number = -(objetd.number)
				end
				objetg.number = objetg.number + (-1 * objetd.number)

				if objetg.number < 0 && objetg.signe == '+'
					objetg.signe = '-'
				end
				objetg.number = objetg.number.round(2)
				objets_d.delete(objetd)
			end
		end
	end
	objets_g.each do |objetg|
		if objetg.number == 0
			objets_g.delete(objetg)
		end
	end
	objets_d.each do |objetd|
		if objetd.number != 0
			objets_g << objetd
		end
	end
end
