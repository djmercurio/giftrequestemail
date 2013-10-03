require 'mail'

class FormController < ApplicationController
  http_basic_authenticate_with :name => "dan", :password => "pass", :only => "index"


  def index
  		@subs = Submission.all
  end

  def show
  		@sub = Submission.find(params[:id])
  end

  def new
  	@sub = Submission.new
  end

  def create
  	@sub = Submission.new(sub_params)
  	print @sub_params
  	#raise params.inspect
  	all = params[:submission]
  	name = all[:name]
  	email = all[:email]
  	size = all[:size]
  	dueMonth = all[:dueMonth]
  	dueYear = all[:dueYear]
  	dueDay = all[:dueDay]
  	gRelationship = all[:gRelationship]
  	gName = all[:gName]
  	gEmail = all[:gEmail]
  	img_path = "http://localhost:3000/"
  	if @sub.save
  		htm_part1 = 	"<html>
					<head>

					<title>mailTemplate_v1a</title>
					<meta http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\">
					</head>
					<body bgcolor=\"#FFFFFF\" leftmargin=\"0\" topmargin=\"0\" marginwidth=\"0\" marginheight=\"0\">
					<!-- Save for Web Slices (mailTemplate_v1a.psd) -->
					<table id=\"Table_01\" width=\"600\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">
					<tr>
						<td>
							<a href=\"http://www.preggonista.com\"><img style=\"display:block\" src=\"#{img_path}mailer_2_01.gif\" width=\"600\" height=\"132\" alt=\"\"></a></td>
					</tr>

					<tr>
						<td background=\"#{img_path}mailer1_03.gif\" width=\"600\" alt=\"\">
				        <div id=\"text1\" style=\"vertical-align: text-top;margin: 20px 30px 20px 30px;\">
          			<p style=\"color:#000;\">"
          htm_part2 = "</p>
 		       </div>
			  </td>
			</tr>
			<tr>
			<td width=\"600\" height=\"200\" alt=\"\">
        
   		     <table id=\"Table_01\" width=\"600\" height=\"200\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">
			<tr>
			<td colspan=\"7\">
			<img style=\"display:block\" src=\"#{img_path}bottom_01.jpg\" width=\"583\" height=\"27\" alt=\"\"></td>
			<td rowspan=\"3\">
			<img style=\"display:block\" src=\"#{img_path}bottom_02.jpg\" width=\"17\" height=\"200\" alt=\"\"></td>
			</tr>
		<tr>
		<td>
			<img style=\"display:block\" src=\"#{img_path}bottom_03.jpg\" width=\"333\" height=\"50\" alt=\"\"></td>
		<td>
			<a href=\"https://www.facebook.com/Preggonista\" target=\"_blank\"><img style=\"display:block\" src=\"#{img_path}bottom_04.jpg\" width=\"41\" height=\"50\" alt=\"\" border=\"none\"></a></td>
		<td>
			<a href=\"https://twitter.com/preggonistalife\" target=\"_blank\"><img style=\"display:block\" src=\"#{img_path}bottom_05.jpg\" width=\"41\" height=\"50\" alt=\"\" border=\"none\"></a></td>
		<td>
			<a href=\"http://instagram.com/preggonista\" target=\"_blank\"><img style=\"display:block\" src=\"#{img_path}bottom_06.jpg\" width=\"42\" height=\"50\" alt=\"\" border=\"none\"></a></td>
		<td>
			<a href=\"http://www.pinterest.com/preggonista/\" target=\"_blank\"><img style=\"display:block\" src=\"#{img_path}bottom_07.jpg\" width=\"40\" height=\"50\" alt=\"\" border=\"none\"></a></td>
		<td>
			<a href=\"http://www.youtube.com/channel/UCOwGvE6uS6oUya6KYKwFpCg?feature=watch\" target=\"_blank\"><img style=\"display:block\" src=\"#{img_path}bottom_08.jpg\" width=\"41\" height=\"50\" alt=\"\" border=\"none\"></a></td>
		<td>
			<a href=\"http://preggonista.myshopify.com/\" target=\"_blank\"><img style=\"display:block\" src=\"#{img_path}bottom_09.jpg\" width=\"45\" height=\"50\" alt=\"\" border=\"none\"></a></td>
		</tr>
		<tr>
				<td colspan=\"7\">
					<img style=\"display:block\" src=\"#{img_path}bottom_10.jpg\" width=\"583\" height=\"123\" alt=\"\"></td>
			</tr>
		</table>
		        
		        
		        </td>
			</tr>
		</table>
		<!-- End Save for Web Slices -->
		</body>
		</html>
		"








  		if all[:gRelationship] == "Dad-to-be"
  			text = "<b>Dear #{gName}</b>,\r\n\r\n <br /><br />
		Hello dad-to-be! Your beautiful lady, <b>#{name},</b> has requested a <a href=\"http://www.preggonista.com\">Preggonista</a> Gift Box.<br /><br />
		 A Preggonista -- pregnant + fashionista -- Gift Box is the perfect acknowledgement of her beauty during pregnancy. It contains:<br />
		 <ul>
		 \t 	<li>Jersey knit wrap <b>DRESS</b></li>
		 \t 	<li>Preggonista maternity <b>T-SHIRT</b></li>
		 \t 	<li>Fashionable accesory</li>
		 \t 	<li>Maternity-related beauty product</li></ul>
		 What's more, she'll get a Style Guide that will show her 12 different ways she can wear her wrap <b>DRESS</b> -- all to help minimize the number of maternity CLOTHING items she'll need to buy!<br /><br />
		 In addition to the Gift Box, we also offer a monthly Style Box of fashionable goodies on a subscription basis. Each month, she'll have a surprise to look forward to. 
		 Statistics show that the chances of you having a Pregozilla on your hands are fairly low. Yet, every pregnant woman deserves a little extra attention. Below are all the details you need to know to order a Gift Box from Preggonista.<br /><br />
		 <b>HOW TO ORDER</b><br /> #{name}'s Size: #{size}<br />#{name}'s Due Date: #{dueMonth}/#{dueDay}/#{dueYear}<br /><br /><img src=\"#{img_path}bottom_09.jpg\"><br />Visit <a href=\"http://www.preggonista.com/pages/dad-to-be\">www.preggonista.com</a><br /><br />We're here to help if you have questions!<br /><br />With style,<br /> <img src=\"#{img_path}psg.png\"> <br />Your friends at Preggonista
		 <br /><br /><b>P.S., here's a quick list of answers for the most popular questions we've heard:</b><br />
			<ul>
			<li><b>Q:</b> What if she doesn't like it? | <b>A:</b> She can return it and receive a gift card in exchange!</li>
			<li><b>Q:</b> What if someone else buys it for her? | <b>A:</b> Be sure to use this email address: <b>#{email}</b> when you make your purchase. This will prevent someone else from purchasing her the Gift Box as well.</li>
			<li><b>Q:</b> How will I know it'll fit? | <b>A:</b> Look at her regular size clothes and order that size (that's how maternity sizing works!). The items are generous and comfortable, so it's a safe bet that it'll fit. </li></ul>"
		
			msg = htm_part1 + text + htm_part2

		options = { :address              => "smtp.gmail.com",
            :port                 => 587,
            :domain               => 'your.host.name',
            :user_name            => 'dmercurio92@gmail.com',
            :password             => 'j42nweR1',
            :authentication       => 'plain',
            :enable_starttls_auto => true  }

			Mail.defaults do
				delivery_method :smtp, options
			end

			Mail.deliver do
				content_type 'text/html; charset=UTF-8'
				to all[:gEmail]
				from 'gifts@preggonista.com'
				subject "This will make #{all[:name]} HAPPY!"
				body msg
			end

  		end

  		if all[:gRelationship] == "Mom"


  			text ="<b>Dear #{gName}</b>,\r\n\r\n <br /><br />
		Your baby, <b>#{name},</b> is having a baby and she wants a <a href=\"http://www.preggonista.com\">Preggonista</a> Gift Box!<br /><br />
		A Preggonista -- pregnant + fashionista -- Gift Box is the perfect acknowledgement of her beauty during pregnancy. It contains:<br />
		<ul>
		\t 	<li>Jersey knit wrap <b>DRESS</b></li><br />
		\t 	<li>Preggonista maternity <b>T-SHIRT</b></li><br />
		\t 	<li>Fashionable accesory</li><br />
		\t 	<li>Maternity-related beauty product</li><br /><br /></ul>
		What's more, your daughter will get a Style Guide that will show her 12 different ways she can wear her wrap <b>DRESS</b> -- all to help minimize the number of maternity CLOTHING items she'll need to buy!<br /><br />
		In addition to the Gift Box, we also offer a monthly Style Box of fashionable goodies on a subscription basis. Each month, she'll have a surprise to look forward to. 
		Statistics show that the chances of you having a Pregozilla on your hands are fairly low. Yet, every pregnant woman deserves a little extra attention. Below are all the details you need to know to order a Gift Box from Preggonista.<br /><br />
		<b>HOW TO ORDER</b><br /> #{name}'s Size: #{size}<br />#{name}'s Due Date: #{dueMonth}/#{dueDay}/#{dueYear}<br /><br /><img src=\"#{img_path}bottom_09.jpg\"><br />Visit <a href=\"http://www.preggonista.com/collections/buy-gift\">www.preggonista.com</a><br /><br />We're here to help if you have questions!<br /><br />With style,<br /> <img src=\"#{img_path}psg.png\"> Your friends at Preggonista
		<br /><br /><b>P.S., here's a quick list of answers for the most popular questions we've heard:</b><br />
			<ul>
			<li><b>Q:</b> What if she doesn't like it? | <b>A:</b> She can return it and receive a gift card in exchange!</li>
			<li><b>Q:</b> What if someone else buys it for her? | <b>A:</b> Be sure to use this email address: <b>#{email}</b> when you make your purchase. This will prevent someone else from purchasing her the Gift Box as well.</li>
			<li><b>Q:</b> How will I know it'll fit? | <b>A:</b> Look at her regular size clothes and order that size (that's how maternity sizing works!). The items are generous and comfortable, so it's a safe bet that it'll fit. </li></ul>"


  			msg = htm_part1 + text + htm_part2

		options = { :address              => "smtp.gmail.com",
            :port                 => 587,
            :domain               => 'your.host.name',
            :user_name            => 'dmercurio92@gmail.com',
            :password             => 'j42nweR1',
            :authentication       => 'plain',
            :enable_starttls_auto => true  }

			Mail.defaults do
				delivery_method :smtp, options
			end

			Mail.deliver do
				content_type 'text/html; charset=UTF-8'
				to all[:gEmail]
				from 'gifts@preggonista.com'
				subject "This will make #{all[:name]} HAPPY!"
				body msg
			end

  		end

  		if all[:gRelationship] == "Dad"

  			text ="<b>Dear #{gFirstName}</b>,\r\n\r\n <br /><br />
		Your baby, <b>#{name},</b> is having a baby and she wants a <a href=\"http://www.preggonista.com\">Preggonista</a> Gift Box!<br /><br />
		A Preggonista -- pregnant + fashionista -- Gift Box is the perfect acknowledgement of her beauty during pregnancy. It contains:<br />
		<ul>
		\t 	<li>Jersey knit wrap <b>DRESS</b></li><br />
		\t 	<li>Preggonista maternity <b>T-SHIRT</b></li><br />
		\t 	<li>Fashionable accesory</li><br />
		\t 	<li>Maternity-related beauty product</li><br /><br /></ul>
		What's more, your daughter will get a Style Guide that will show her 12 different ways she can wear her wrap <b>DRESS</b> -- all to help minimize the number of maternity CLOTHING items she'll need to buy!<br /><br />
		In addition to the Gift Box, we also offer a monthly Style Box of fashionable goodies on a subscription basis. Each month, she'll have a surprise to look forward to. 
		Statistics show that the chances of you having a Pregozilla on your hands are fairly low. Yet, every pregnant woman deserves a little extra attention. Below are all the details you need to know to order a Gift Box from Preggonista.<br /><br />
		<b>HOW TO ORDER</b><br /> #{name}'s Size: #{size}<br />#{name}'s Due Date: #{dueMonth}/#{dueDay}/#{dueYear}<br /><br /><img src=\"#{img_path}bottom_09.jpg\"><br />Visit <a href=\"http://www.preggonista.com/collections/buy-gift\">www.preggonista.com</a><br /><br />We're here to help if you have questions!<br /><br />With style,<br /> <img src=\"#{img_path}psg.png\"> Your friends at Preggonista
		<br /><br /><b>P.S., here's a quick list of answers for the most popular questions we've heard:</b><br />
			<ul>
			<li><b>Q:</b> What if she doesn't like it? | <b>A:</b> She can return it and receive a gift card in exchange!</li>
			<li><b>Q:</b> What if someone else buys it for her? | <b>A:</b> Be sure to use this email address: <b>#{email}</b> when you make your purchase. This will prevent someone else from purchasing her the Gift Box as well.</li>
			<li><b>Q:</b> How will I know it'll fit? | <b>A:</b> Look at her regular size clothes and order that size (that's how maternity sizing works!). The items are generous and comfortable, so it's a safe bet that it'll fit. </li></ul>"


  			msg = htm_part1 + text + htm_part2

		options = { :address              => "smtp.gmail.com",
            :port                 => 587,
            :domain               => 'your.host.name',
            :user_name            => 'dmercurio92@gmail.com',
            :password             => 'j42nweR1',
            :authentication       => 'plain',
            :enable_starttls_auto => true  }

			Mail.defaults do
				delivery_method :smtp, options
			end

			Mail.deliver do
				content_type 'text/html; charset=UTF-8'
				to all[:gEmail]
				from 'gifts@preggonista.com'
				subject "This will make #{all[:name]} HAPPY!"
				body msg
			end
  		end

  		if all[:gRelationship] == "Sister"
  			#declare text
  			text ="<b>Dear #{gName}</b>,\r\n\r\n <br /><br />
		Your sis, <b>#{name},</b> is having a baby and she wants a <a href=\"http://www.preggonista.com\">Preggonista</a> Gift Box!<br /><br />
		A Preggonista -- pregnant + fashionista -- Gift Box is the perfect acknowledgement of her beauty during pregnancy. It contains:<br />
		<ul>
		\t 	<li>Jersey knit wrap <b>DRESS</b> to take her from day to evening throughout and after her pregnancy</li><br />
		\t 	<li>Preggonista maternity <b>T-SHIRT</b> for casual days</li><br />
		\t 	<li>Fashionable accesory to add some color or texture to an outfit</li><br />
		\t 	<li>Maternity-related beauty product to help her keep that pregnant glow</li></ul>
		What's more, your sister will get a Style Guide that will show her 12 different ways she can wear her wrap <b>DRESS</b> -- all to help minimize the number of maternity CLOTHING items she'll need to buy!<br /><br />
		In addition to the Gift Box, we also offer a monthly Style Box of fashionable goodies on a subscription basis. Each month, she'll have a surprise to look forward to. 
		Statistics show that the chances of you having a Pregozilla on your hands are fairly low. Yet, every pregnant woman deserves a little extra attention. Below are all the details you need to know to order a Gift Box from Preggonista.<br /><br />
		<b>HOW TO ORDER</b><br /> #{name}'s Size: #{size}<br />#{name}'s Due Date: #{dueMonth}/#{dueDay}/#{dueYear}<br /><br /><img src=\"#{img_path}bottom_09.jpg\"><br />Visit <a href=\"http://www.preggonista.com/collections/buy-gift\">www.preggonista.com</a><br /><br />We're here to help if you have questions!<br /><br />With style,<br /> <img src=\"#{img_path}psg.png\"> Your friends at Preggonista
		<br /><br /><b>P.S., here's a quick list of answers for the most popular questions we've heard:</b><br />
			<ul>
			<li><b>Q:</b> What if she doesn't like it? | <b>A:</b> She can return it and receive a gift card in exchange!</li>
			<li><b>Q:</b> What if someone else buys it for her? | <b>A:</b> Be sure to use this email address: <b>#{email}</b> when you make your purchase. This will prevent someone else from purchasing her the Gift Box as well.</li>
			<li><b>Q:</b> How will I know it'll fit? | <b>A:</b> Look at her regular size clothes and order that size (that's how maternity sizing works!). The items are generous and comfortable, so it's a safe bet that it'll fit. </li></ul>"


  			msg = htm_part1 + text + htm_part2

		options = { :address              => "smtp.gmail.com",
            :port                 => 587,
            :domain               => 'your.host.name',
            :user_name            => 'dmercurio92@gmail.com',
            :password             => 'j42nweR1',
            :authentication       => 'plain',
            :enable_starttls_auto => true  }

			Mail.defaults do
				delivery_method :smtp, options
			end

			Mail.deliver do
				content_type 'text/html; charset=UTF-8'
				to all[:gEmail]
				from 'gifts@preggonista.com'
				subject "This will make #{all[:name]} HAPPY!"
				body msg
			end
  		end

  		if all[:gRelationship] == "Bestfriend"
  			#declare text
		text ="<b>Dear #{gFirstName}</b>,\r\n\r\n <br /><br />
		Your bestie, <b>#{name},</b> is having a baby and she wants a <a href=\"http://www.preggonista.com\">Preggonista</a> Gift Box!<br /><br />
		A Preggonista -- pregnant + fashionista -- Gift Box is the perfect acknowledgement of her beauty during pregnancy. It contains:<br />
		<ul>
		\t 	<li>Jersey knit wrap <b>DRESS</b></li>
		\t 	<li>Preggonista maternity <b>T-SHIRT</b></li>
		\t 	<li>Fashionable accesory</li>
		\t 	<li>Maternity-related beauty product</li></ul>
		What's more, your girl will get a Style Guide that will show her 12 different ways she can wear her wrap <b>DRESS</b> -- all to help minimize the number of maternity CLOTHING items she'll need to buy!<br /><br />
		In addition to the Gift Box, we also offer a monthly Style Box of fashionable goodies on a subscription basis. Each month, she'll have a surprise to look forward to. 
		Statistics show that the chances of you having a Pregozilla on your hands are fairly low. Yet, every pregnant woman deserves a little extra attention. Below are all the details you need to know to order a Gift Box from Preggonista.<br /><br />
		<b>HOW TO ORDER</b><br /> #{name}'s Size: #{size}<br />#{name}'s Due Date: #{dueMonth}/#{dueDay}/#{dueYear}<br /><br /><img src=\"#{img_path}bottom_09.jpg\"><br />Visit <a href=\"http://www.preggonista.com/collections/buy-gift\">www.preggonista.com</a><br /><br />We're here to help if you have questions!<br /><br />With style,<br /> <img src=\"#{img_path}psg.png\"> Your friends at Preggonista
		<br /><br /><b>P.S., here's a quick list of answers for the most popular questions we've heard:</b><br />
			<ul>
			<li><b>Q:</b> What if she doesn't like it? | <b>A:</b> She can return it and receive a gift card in exchange!</li>
			<li><b>Q:</b> What if someone else buys it for her? | <b>A:</b> Be sure to use this email address: <b>#{email}</b> when you make your purchase. This will prevent someone else from purchasing her the Gift Box as well.</li>
			<li><b>Q:</b> How will I know it'll fit? | <b>A:</b> Look at her regular size clothes and order that size (that's how maternity sizing works!). The items are generous and comfortable, so it's a safe bet that it'll fit. </li></ul>"

  			msg = htm_part1 + text + htm_part2

		options = { :address              => "smtp.gmail.com",
            :port                 => 587,
            :domain               => 'your.host.name',
            :user_name            => 'dmercurio92@gmail.com',
            :password             => 'j42nweR1',
            :authentication       => 'plain',
            :enable_starttls_auto => true  }

			Mail.defaults do
				delivery_method :smtp, options
			end

			Mail.deliver do
				content_type 'text/html; charset=UTF-8'
				to all[:gEmail]
				from 'gifts@preggonista.com'
				subject "This will make #{all[:name]} HAPPY!"
				body msg
			end
  		end

  		if all[:gRelationship] == "Coworker"
  			#declare text
  			text ="<b>Dear #{gFirstName}</b>,\r\n\r\n <br /><br />
		Your favorite co-worker, <b>#{name},</b> is having a baby and she wants a <a href=\"http://www.preggonista.com\">Preggonista</a> Gift Box!<br /><br />
		A Preggonista -- pregnant + fashionista -- Gift Box is the perfect acknowledgement of her beauty during pregnancy. It contains:<br />
		<ul>
		\t 	<li>Jersey knit wrap <b>DRESS</b></li>
		\t 	<li>Preggonista maternity <b>T-SHIRT</b></li>
		\t 	<li>Fashionable accesory</li>
		\t 	<li>Maternity-related beauty product</li></ul>
		What's more, #{name} will get a Style Guide that will show her 12 different ways she can wear her wrap <b>DRESS</b> -- all to help minimize the number of maternity CLOTHING items she'll need to buy!<br /><br />
		In addition to the Gift Box, we also offer a monthly Style Box of fashionable goodies on a subscription basis. Each month, she'll have a surprise to look forward to. 
		Statistics show that the chances of you having a Pregozilla on your hands are fairly low. Yet, every pregnant woman deserves a little extra attention. Below are all the details you need to know to order a Gift Box from Preggonista.<br /><br />
		<b>HOW TO ORDER</b><br /> #{name}'s Size: #{size}<br />#{name}'s Due Date: #{dueMonth}/#{dueDay}/#{dueYear}<br /><br /><img src=\"#{img_path}bottom_09.jpg\"><br />Visit <a href=\"http://www.preggonista.com/collections/buy-gift\">www.preggonista.com</a><br /><br />We're here to help if you have questions!<br /><br />With style,<br /> <img src=\"#{img_path}psg.png\"> Your friends at Preggonista
		<br /><br /><b>P.S., here's a quick list of answers for the most popular questions we've heard:</b><br />
			<ul>
			<li><b>Q:</b> What if she doesn't like it? | <b>A:</b> She can return it and receive a gift card in exchange!</li>
			<li><b>Q:</b> What if someone else buys it for her? | <b>A:</b> Be sure to use this email address: <b>#{email}</b> when you make your purchase. This will prevent someone else from purchasing her the Gift Box as well.</li>
			<li><b>Q:</b> How will I know it'll fit? | <b>A:</b> Look at her regular size clothes and order that size (that's how maternity sizing works!). The items are generous and comfortable, so it's a safe bet that it'll fit. </li></ul>"


  			msg = htm_part1 + text + htm_part2

		options = { :address              => "smtp.gmail.com",
            :port                 => 587,
            :domain               => 'your.host.name',
            :user_name            => 'dmercurio92@gmail.com',
            :password             => 'j42nweR1',
            :authentication       => 'plain',
            :enable_starttls_auto => true  }

			Mail.defaults do
				delivery_method :smtp, options
			end

			Mail.deliver do
				content_type 'text/html; charset=UTF-8'
				to all[:gEmail]
				from 'gifts@preggonista.com'
				subject "This will make #{all[:name]} HAPPY!"
				body msg
			end
  		end

  		if all[:gRelationship] == "Other"
  			#declare text
  			text ="<b>Dear #{gFirstName}</b>,\r\n\r\n <br /><br />
		<b>#{name}</b> is having a baby and she wants a <a href=\"http://www.preggonista.com\">Preggonista</a> Gift Box!<br /><br />
		A Preggonista -- pregnant + fashionista -- Gift Box is the perfect acknowledgement of her beauty during pregnancy. It contains:<br />
		<ul>
		\t 	<li>Jersey knit wrap <b>DRESS</b></li>
		\t 	<li>Preggonista maternity <b>T-SHIRT</b></li>
		\t 	<li>Fashionable accesory</li>
		\t 	<li>Maternity-related beauty product</li></ul>
		What's more, preggonistas get a Style Guide that will show her 12 different ways she can wear her wrap <b>DRESS</b> -- all to help minimize the number of maternity CLOTHING items she'll need to buy!<br /><br />
		In addition to the Gift Box, we also offer a monthly Style Box of fashionable goodies on a subscription basis. Each month, she'll have a surprise to look forward to. 
		Statistics show that the chances of you having a Pregozilla on your hands are fairly low. Yet, every pregnant woman deserves a little extra attention. Below are all the details you need to know to order a Gift Box from Preggonista.<br /><br />
		<b>HOW TO ORDER</b><br /> #{name}'s Size: #{size}<br />#{name}'s Due Date: #{dueMonth}/#{dueDay}/#{dueYear}<br /><br /><img src=\"#{img_path}bottom_09.jpg\"><br />Visit <a href=\"http://www.preggonista.com/collections/buy-gift\">www.preggonista.com</a><br /><br />We're here to help if you have questions!<br /><br />With style,<br /> <img src=\"#{img_path}psg.png\"> Your friends at Preggonista
		<br /><br /><b>P.S., here's a quick list of answers for the most popular questions we've heard:</b><br />
			<ul>
			<li><b>Q:</b> What if she doesn't like it? | <b>A:</b> She can return it and receive a gift card in exchange!</li>
			<li><b>Q:</b> What if someone else buys it for her? | <b>A:</b> Be sure to use this email address: <b>#{email}</b> when you make your purchase. This will prevent someone else from purchasing her the Gift Box as well.</li>
			<li><b>Q:</b> How will I know it'll fit? | <b>A:</b> Look at her regular size clothes and order that size (that's how maternity sizing works!). The items are generous and comfortable, so it's a safe bet that it'll fit. </li></ul>"

  			msg = htm_part1 + text + htm_part2

		options = { :address              => "smtp.gmail.com",
            :port                 => 587,
            :domain               => 'your.host.name',
            :user_name            => 'dmercurio92@gmail.com',
            :password             => 'j42nweR1',
            :authentication       => 'plain',
            :enable_starttls_auto => true  }

			Mail.defaults do
				delivery_method :smtp, options
			end

			Mail.deliver do
				content_type 'text/html; charset=UTF-8'
				to all[:gEmail]
				from 'gifts@preggonista.com'
				subject "This will make #{all[:name]} HAPPY!"
				body msg
			end
  		end
  		  		#redirect_to form_formdisplay_path, :notice => "post saved"
  		

  		render "formdisplay"
  	else
  		render "new"
  	end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def formdisplay

  end

  private

  def sub_params
  	params.require(:submission).permit(:email,:name,:size,:dueMonth,:dueDay,:dueYear,:gName,:gEmail,:gRelationship)
  end

end
