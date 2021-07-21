# Soundarya Baskar

# earth day theme!!!!
# show 2 graphs based on user input from the keyboard...
# first show the graph hydropower usage in the world, then show solar power
# switch between the two graphs using left and right keys, (a and d)
# each axis point on the y-axis is 1000 TWh
# each axis point on the x-axis is 10 years from 1960

########################################################################################################################################################################################

# set pixel dim to 4x4
# set display dim to 256x256

# width of screen in pixels
.eqv WIDTH 64
# height of screen in pixels
.eqv HEIGHT 64

# colors
.eqv RED 0x00FF0000
.eqv BLUE 0x000000FF
.eqv YELLOW 0x00FFFF00
.eqv WHITE 0x00FFFFFF
.eqv CYAN 0x0000FFFF
.eqv MAGENTA 0x00FF00FF
.eqv GREEN   0x0000FF00

.data
colors: .word GREEN, BLUE, RED, WHITE, MAGENTA, CYAN, YELLOW, 
	      GREEN, BLUE, RED, WHITE, MAGENTA, CYAN, YELLOW, 
	      GREEN, BLUE, RED, WHITE, MAGENTA, CYAN, YELLOW, 
	      GREEN, BLUE, RED, WHITE, MAGENTA, CYAN, YELLOW,
	      GREEN, BLUE, RED, WHITE, MAGENTA, CYAN, YELLOW,
	      GREEN, BLUE, RED, WHITE, MAGENTA, CYAN, YELLOW
	      GREEN, BLUE, RED, WHITE, MAGENTA, CYAN, YELLOW
	      
temp1:	.word	10
temp2:	.word	10
msg1:	.asciiz	"Happy Earth Day! <3"
msg2:	.asciiz	"Welcome to the Graph Simulator!"
msg3:	.asciiz	"Here you can switch between two graphs that show the usage of hydropower and solar power in the world using your keyboard!!"
msg4:	.asciiz	"You will first be shown the hydropower graph, show in blue:)"
msg5:	.asciiz	"You can switch to see the solar graph (shown in yellow), using the letter 'a' key in your keyboard."
msg6:	.asciiz	"You can switch back to the hydropower graph using the letter 'd' key in your keyboard!"
msg7:	.asciiz	"The X-axis represents the years from 1950 to 2020 in increments of 10 years."
msg8:	.asciiz	"The Y-axis represents the TWh (terawatt hour) in increments of 1000."
msg9:	.asciiz	"Press the letter 'w' on your keyboard for more information"

msg10:	.asciiz	"More Information:\nRenewable energy is the fastest-growing energy source globally and in the United States. Globally, eighteen percent of the energy consumed globally for heating, power," 
msg11:	.asciiz	"and transportation was from renewable sources in 2017. Nearly 60 percent came from modern renewables (i.e., biomass, geothermal, solar, hydro, wind, and biofuels) and "
msg12: 	.asciiz	"the remainder from traditional biomass (used in residential heating and cooking in developing countries). Renewables made up 26.2 percent of global electricity generation in 2018."
msg13:	.asciiz	"That is expected to rise to 45 percent by 2040. Most of the increase will likely come from solar, wind, and hydropower."

msg14:	.asciiz	"Press the spacebar to end the program!"
msg15:	.asciiz	"Information for the graph is from: https://ourworldindata.org/"
msg16:	.asciiz	"Extra Information is from: https://www.c2es.org/content/renewable-energy"
newL: 	.asciiz "\n"

.text
main:

	# output messages regarding the graph simulator..
	li	$v0, 4
	la	$a0, msg1
	syscall

	li	$v0, 4		# output a new line
	la	$a0, newL
	syscall
		
	li	$v0, 4
	la	$a0, msg2
	syscall
	
	li	$v0, 4		# output a new line
	la	$a0, newL
	syscall
	
	li	$v0, 4
	la	$a0, msg3
	syscall	
	
	li	$v0, 4		# output a new line
	la	$a0, newL
	syscall
	
	li	$v0, 4
	la	$a0, msg4
	syscall
	
	li	$v0, 4		# output a new line
	la	$a0, newL
	syscall
	
	li	$v0, 4
	la	$a0, msg5
	syscall	
	
	li	$v0, 4		# output a new line
	la	$a0, newL
	syscall

	li	$v0, 4
	la	$a0, msg6
	syscall
	
	li	$v0, 4		# output a new line
	la	$a0, newL
	syscall
	
	li	$v0, 4
	la	$a0, msg7
	syscall	
	
	li	$v0, 4		# output a new line
	la	$a0, newL
	syscall
	
	li	$v0, 4
	la	$a0, msg8
	syscall	
	
	li	$v0, 4		# output a new line
	la	$a0, newL
	syscall
	
	li	$v0, 4		# output a new line
	la	$a0, newL
	syscall
	
	li	$v0, 4
	la	$a0, msg9
	syscall	
	
	li	$v0, 4		# output a new line
	la	$a0, newL
	syscall
	
	li	$v0, 4		# output a new line
	la	$a0, newL
	syscall
	
	li	$v0, 4
	la	$a0, msg14
	syscall
	
	li	$v0, 4		# output a new line
	la	$a0, newL
	syscall
	
	li	$v0, 4		# output a new line
	la	$a0, newL
	syscall
	
	li	$v0, 4
	la	$a0, msg15
	syscall
	
	li	$v0, 4		# output a new line
	la	$a0, newL
	syscall
	
	li	$v0, 4
	la	$a0, msg16
	syscall
	
	li	$v0, 4		# output a new line
	la	$a0, newL
	syscall
	
	# set up starting position at the top right for x-axis of the graph
	addi 	$a0, $0, WIDTH    # a0 = X = WIDTH/2
	addi	$a0, $a0, -50	  # go to the left
	sra 	$a0, $a0, 1
	addi 	$a1, $0, HEIGHT   # a1 = Y = HEIGHT/2
	addi	$a1, $a1, -50	  # go up
	sra 	$a1, $a1, 1
	
	la	$a3, colors
	la	$a2, 1	# temp value 
	
	li 	$t0, 0 	# index counter 
	li	$t6, 0	# color counter
	li	$t5, 0 	# overall counter (amount of times looped)
	li	$t8, 7	# load 7 into t8
	li	$t2, 4	# load 4 into t2
	jal 	loopX	# draws x-axis and then y-axis

####################################################################################################################################################################################################
pause:
	# save $ra
	addi	$sp, $sp, -8
	sw	$ra, ($sp)
	sw	$t7, 4($sp)
	
	li	$v0, 32
	li	$t7, 5
	syscall
	
	# restore $ra
	lw	$ra, ($sp)
	lw	$t7, 4($sp)
	addi	$sp, $sp, 8
	jr $ra
	
##################################################################################################################################
# X-AXIS

loopX:
	# checking for keyboard movement, if none then branch, else blackout
	bne	$a2, 0, contAgain1
	jal pause
	jal	draw_pixel
	add 	$t0, $t0, 1 # i++
	addi	$a1, $a1, 1	# add 1 from the y axis
	blt 	$t0, 49, loopX
	li 	$t0, 0 		# i = 0
	j exit
	
contAgain1:	
	add	$t6, $t0, $t5	# color counter = index counter + overall counter
	
	div	$t6, $t8	# divide by 7
	mfhi	$t4
	beq	$t4, 0, axisPoint
	j go

axisPoint:
	addi 	$a2, $0, WHITE  # a2 = WHITE, for drawing the axis points
	addi	$a0, $a0, -1	# go to the left one
	jal draw_pixel
	addi	$a0, $a0, -1	# go to the left one
	jal draw_pixel
	addi	$a0, $a0, 2	# go back to original point
	
go:	
	bgt	$t6, 48, colorCounter1
	
	mul 	$t1, $t0, $t2 	# i*4
	add	$t3, $a3, $t1	# add offset to color address
	lw 	$a2, ($t3)
	j continue1
	
colorCounter1:
	div	$t6, $t8	# divide color counter by 7
	mfhi	$t4		# remainder in t4: color counter%7
	mul 	$t1, $t4, $t2 	# color counter%7 * 4
	add	$t3, $s1, $t1	# add offset to color address
	lw 	$a2, ($t3)
	
continue1:
	jal	draw_pixel
	add 	$t0, $t0, 1 	# i++
	
	addi	$a1, $a1, 1	# add 1 from the y axis
	blt 	$t0, 49, loopX
	li 	$t0, 0 		# i = 0
	
###############################################################################################################################################
# Y- AXIS
	sw	$a0, temp1	# save the x value
	sw	$a1, temp2	# save the y value
	
loopY:
	# checking for keyboard movement, if none then branch, else blackout
	bne	$a2, 0, contAgain2
	jal pause
	jal	draw_pixel
	add 	$t0, $t0, 1 # i++
	addi	$a0, $a0, -1	# subract 1 from the x axis
	blt 	$t0, 49, loopY
	li 	$t0, 0 		# i = 0
	j exit
	
	
contAgain2:	

	add	$t6, $t0, $t5	# color counter = index counter + overall counter
	div	$t6, $t8	# divide by 7
	mfhi	$t4
	beq	$t4, 0, axisPoint1
	j go1

axisPoint1:
	beq	$t6, 0, go1
	
	addi 	$a2, $0, WHITE  # a2 = WHITE, for drawing the axis points
	addi	$a1, $a1, 1	# go down one
	jal draw_pixel
	addi	$a1, $a1, 1	# go down one
	jal draw_pixel
	addi	$a1, $a1, -2	# go back to original point
	
go1:	
	bgt	$t6, 48, colorCounter2
	
	mul 	$t1, $t0, $t2 	# i*4
	add	$t3, $a3, $t1	# add offset to color address
	lw 	$a2, ($t3)
	j continue2
	
colorCounter2:
	div	$t6, $t8	# divide color counter by 7
	mfhi	$t4	# remainder in t4: color counter%7
	mul 	$t1, $t4, $t2 	# color counter%7 * 4
	add	$t3, $s1, $t1	# add offset to color address
	lw 	$a2, ($t3)
	
continue2:
	jal	draw_pixel
	add 	$t0, $t0, 1 	# i++
	
	addi	$a0, $a0, 1	# add 1 from the x axis
	blt 	$t0, 49, loopY
	
axisPoint3:
	# last point on the x-axis
	addi 	$a2, $0, WHITE  # a2 = WHITE, for drawing the axis points
	addi	$a0, $a0, -1	# go down one
	addi	$a1, $a1, 1	# go down one
	jal draw_pixel
	addi	$a1, $a1, 1	# go down one
	jal draw_pixel
	addi	$a1, $a1, -2	# go back to original point
	li 	$t0, 0 		# i = 0

pointHydropower:
	# drawing graph 1: Hydropower!!!! 
	# have to draw pixel by pixel since graphs are not linear...
	
	# check for input
	lw $s3, 0xffff0000  #t1 holds if input available
    	beq $s3, 0, goOn  #If no input, keep displaying
    	# process input
	lw 	$s2, 0xffff0004
	beq	$s2, 32, exit	# input space
	beq	$s2, 119, up1 	# input w
upback1:
	#beq	$s2, 115, down 	# input s
	beq	$s2, 97, left  	# input a
	beq	$s2, 100, right	# input d
	# invalid input, ignore
	j	goOn

goOn:

	addi 	$a2, $0, CYAN  # a2 = CYAN, for drawing the points
	lw	$a0, temp1	# put saved origin at x
	lw	$a1, temp2	# put saved origin at y
	
	addi	$a1, $a1, -7	# go to first dash on y-axis
	addi	$a0, $a0, 1	# add one to x-axis
	jal pause
	jal pause
	jal draw_pixel
	
loop1:
	addi	$a0, $a0, 1	# add one to x-axis
	jal pause
	jal pause
	jal draw_pixel
	addi	$a0, $a0, 1	# add one to x-axis
	jal pause
	jal pause
	jal draw_pixel	
	addi	$a0, $a0, 1	# add one to x-axis
	jal pause
	jal pause
	jal draw_pixel
	
	addi	$a0, $a0, 1	# add one to x-axis
	addi	$a1, $a1, -1	# add one to y axis
	jal pause
	jal pause
	jal draw_pixel
	
	addi	$a0, $a0, 1	# add one to x-axis
	addi	$a1, $a1, -1	# add one to y axis
	jal pause
	jal pause
	jal draw_pixel
	
	addi	$a0, $a0, 1	# add one to x-axis
	jal pause
	jal pause
	jal draw_pixel
	
	addi	$a0, $a0, 1	# add one to x-axis
	jal pause
	jal pause
	jal draw_pixel
	addi	$a0, $a0, 1	# add one to x-axis
	jal pause
	jal pause
	jal draw_pixel
	
	addi	$a0, $a0, 1	# add one to x-axis
	addi	$a1, $a1, -1	# add one to y axis
	jal pause
	jal pause
	jal draw_pixel
	
	addi	$a0, $a0, 1	# add one to x-axis
	jal pause
	jal pause
	jal draw_pixel
	
	addi	$a0, $a0, 1	# add one to x-axis
	addi	$a1, $a1, -1	# add one to y axis
	jal pause
	jal pause
	jal draw_pixel
	
	addi	$a0, $a0, 1	# add one to x-axis
	jal pause
	jal pause
	jal draw_pixel
	addi	$a0, $a0, 1	# add one to x-axis
	jal pause
	jal pause
	jal draw_pixel

	addi	$a0, $a0, 1	# add one to x-axis
	addi	$a1, $a1, -1	# add one to y axis
	jal pause
	jal pause
	jal draw_pixel
	
	addi	$a0, $a0, 1	# add one to x-axis
	addi	$a1, $a1, -1	# add one to y axis
	jal pause
	jal pause
	jal draw_pixel
	
	addi	$a0, $a0, 1	# add one to x-axis
	jal pause
	jal pause
	jal draw_pixel
	
	addi	$a0, $a0, 1	# add one to x-axis
	jal pause
	jal pause
	jal draw_pixel
	addi	$a0, $a0, 1	# add one to x-axis
	jal pause
	jal pause
	jal draw_pixel
	
	addi	$a0, $a0, 1	# add one to x-axis
	addi	$a1, $a1, -1	# add one to y axis
	jal pause
	jal pause
	jal draw_pixel
	
	addi	$a0, $a0, 1	# add one to x-axis
	jal pause
	jal pause
	jal draw_pixel
	
	addi	$a0, $a0, 1	# add one to x-axis
	jal pause
	jal pause
	jal draw_pixel
	addi	$a0, $a0, 1	# add one to x-axis
	jal pause
	jal pause
	jal draw_pixel
	
	addi	$a0, $a0, 1	# add one to x-axis
	addi	$a1, $a1, -1	# add one to y axis
	jal pause
	jal pause
	jal draw_pixel
	
	addi	$a0, $a0, 1	# add one to x-axis
	jal pause
	jal pause
	jal draw_pixel
	addi	$a0, $a0, 1	# add one to x-axis
	jal pause
	jal pause
	jal draw_pixel
	
	addi	$a0, $a0, 1	# add one to x-axis
	jal pause
	jal pause
	jal draw_pixel
	addi	$a0, $a0, 1	# add one to x-axis
	jal pause
	jal pause
	jal draw_pixel	
	addi	$a0, $a0, 1	# add one to x-axis
	jal pause
	jal pause
	jal draw_pixel
	
	addi	$a0, $a0, 1	# add one to x-axis
	addi	$a1, $a1, -1	# add one to y axis
	jal pause
	jal pause
	jal draw_pixel
	
	addi	$a0, $a0, 1	# add one to x-axis
	addi	$a1, $a1, -1	# add one to y axis
	jal pause
	jal pause
	jal draw_pixel
	
	addi	$a0, $a0, 1	# add one to x-axis
	addi	$a1, $a1, -1	# add one to y axis
	jal pause
	jal pause
	jal draw_pixel
	
	addi	$a0, $a0, 1	# add one to x-axis
	addi	$a1, $a1, -1	# add one to y axis
	jal pause
	jal pause
	jal draw_pixel

	addi	$a0, $a0, 1	# add one to x-axis
	addi	$a1, $a1, -1	# add one to y axis
	jal pause
	jal pause
	jal draw_pixel
	
	addi	$a0, $a0, 1	# add one to x-axis
	addi	$a1, $a1, -1	# add one to y axis
	jal pause
	jal pause
	jal draw_pixel
	
	addi	$a0, $a0, 1	# add one to x-axis
	addi	$a1, $a1, -1	# add one to y axis
	jal pause
	jal pause
	jal draw_pixel
	
	addi	$a0, $a0, 1	# add one to x-axis
	addi	$a1, $a1, -1	# add one to y axis
	jal pause
	jal pause
	jal draw_pixel

	addi	$a0, $a0, 1	# add one to x-axis
	addi	$a1, $a1, -1	# add one to y axis
	jal pause
	jal pause
	jal draw_pixel
	
	addi	$a0, $a0, 1	# add one to x-axis
	addi	$a1, $a1, -1	# add one to y axis
	jal pause
	jal pause
	jal draw_pixel		
	
	addi	$a0, $a0, 1	# add one to x-axis
	addi	$a1, $a1, -1	# add one to y axis
	jal pause
	jal pause
	jal draw_pixel	
	
	addi	$a0, $a0, 1	# add one to x-axis
	jal pause
	jal pause
	jal draw_pixel
	addi	$a0, $a0, 1	# add one to x-axis
	jal pause
	jal pause
	jal draw_pixel	
	addi	$a0, $a0, 1	# add one to x-axis
	jal pause
	jal pause
	jal draw_pixel
	addi	$a0, $a0, 1	# add one to x-axis
	jal pause
	jal pause
	jal draw_pixel	
	
	addi	$a0, $a0, 1	# add one to x-axis
	addi	$a1, $a1, -1	# add one to y axis
	jal pause
	jal pause
	jal draw_pixel	
	
	addi	$a0, $a0, 1	# add one to x-axis
	addi	$a1, $a1, -1	# add one to y axis
	jal pause
	jal pause
	jal draw_pixel
	
	beq	$a2, 0, switch
	
	j pointHydropower	
	
################################################################################################################################################
right:
	li	$a2, 0	  	# a2 = BLACK, black out the points
	
	lw	$a0, temp1	# put saved origin at x
	lw	$a1, temp2	# put saved origin at y
	
	addi	$a1, $a1, -7	# go to first dash on y-axis
	addi	$a0, $a0, 1	# add one to x-axis
	jal pause
	jal pause
	jal draw_pixel
	j loop2

switch:
	# drawing graph 2: Solar!!!! 
	# have to draw pixel by pixel since graphs are not linear...

	# check for input
	lw $s3, 0xffff0000  #t1 holds if input available
    	beq $s3, 0, goOn1  #If no input, keep displaying
    	# process input
	lw 	$s2, 0xffff0004
	beq	$s2, 32, exit	# input space
	beq	$s2, 119, up2 	# input w
upback2:
	#beq	$s2, 115, down 	# input s
	beq	$s2, 97, left  	# input a
	beq	$s2, 100, right	# input d
	# invalid input, ignore
	j	goOn1

goOn1:

	addi 	$a2, $0, YELLOW  # a2 = YELLOW, for drawing the points : yellow for solar
	lw	$a0, temp1	# put saved origin at x
	lw	$a1, temp2	# put saved origin at y
	
	addi	$a1, $a1, -7	# go to first dash on y-axis
	addi	$a0, $a0, 1	# add one to x-axis
	jal pause
	jal pause
	jal draw_pixel
	
loop2:
	
	addi	$a0, $a0, 1	# add one to x-axis
	jal pause
	jal pause
	jal draw_pixel
	addi	$a0, $a0, 1	# add one to x-axis
	jal pause
	jal pause
	jal draw_pixel	
	addi	$a0, $a0, 1	# add one to x-axis
	jal pause
	jal pause
	jal draw_pixel
	
	addi	$a0, $a0, 1	# add one to x-axis
	addi	$a1, $a1, -1	# add one to y axis
	jal pause
	jal pause
	jal draw_pixel
	
	addi	$a0, $a0, 1	# add one to x-axis
	addi	$a1, $a1, -1	# add one to y axis
	jal pause
	jal pause
	jal draw_pixel
	
	addi	$a0, $a0, 1	# add one to x-axis
	jal pause
	jal pause
	jal draw_pixel
	
	addi	$a0, $a0, 1	# add one to x-axis
	jal pause
	jal pause
	jal draw_pixel
	addi	$a0, $a0, 1	# add one to x-axis
	jal pause
	jal pause
	jal draw_pixel
	
	addi	$a0, $a0, 1	# add one to x-axis
	addi	$a1, $a1, -1	# add one to y axis
	jal pause
	jal pause
	jal draw_pixel
	
	addi	$a0, $a0, 1	# add one to x-axis
	jal pause
	jal pause
	jal draw_pixel
	
	addi	$a0, $a0, 1	# add one to x-axis
	addi	$a1, $a1, -1	# add one to y axis
	jal pause
	jal pause
	jal draw_pixel
	
	addi	$a0, $a0, 1	# add one to x-axis
	jal pause
	jal pause
	jal draw_pixel
	addi	$a0, $a0, 1	# add one to x-axis
	jal pause
	jal pause
	jal draw_pixel

	addi	$a0, $a0, 1	# add one to x-axis
	addi	$a1, $a1, -1	# add one to y axis
	jal pause
	jal pause
	jal draw_pixel
	
	addi	$a0, $a0, 1	# add one to x-axis
	addi	$a1, $a1, -1	# add one to y axis
	jal pause
	jal pause
	jal draw_pixel
	
	addi	$a0, $a0, 1	# add one to x-axis
	jal pause
	jal pause
	jal draw_pixel
	
	addi	$a0, $a0, 1	# add one to x-axis
	jal pause
	jal pause
	jal draw_pixel
	addi	$a0, $a0, 1	# add one to x-axis
	jal pause
	jal pause
	jal draw_pixel
	
	addi	$a0, $a0, 1	# add one to x-axis
	addi	$a1, $a1, -1	# add one to y axis
	jal pause
	jal pause
	jal draw_pixel
	
	addi	$a0, $a0, 1	# add one to x-axis
	jal pause
	jal pause
	jal draw_pixel
	
	addi	$a0, $a0, 1	# add one to x-axis
	jal pause
	jal pause
	jal draw_pixel
	addi	$a0, $a0, 1	# add one to x-axis
	jal pause
	jal pause
	jal draw_pixel
	
	addi	$a0, $a0, 1	# add one to x-axis
	addi	$a1, $a1, -1	# add one to y axis
	jal pause
	jal pause
	jal draw_pixel
	
	addi	$a0, $a0, 1	# add one to x-axis
	addi	$a1, $a1, -1	# add one to y axis
	jal pause
	jal pause
	jal draw_pixel
	
	addi	$a0, $a0, 1	# add one to x-axis
	addi	$a1, $a1, -1	# add one to y axis
	jal pause
	jal pause
	jal draw_pixel
	
	addi	$a0, $a0, 1	# add one to x-axis
	addi	$a1, $a1, -1	# add one to y axis
	jal pause
	jal pause
	jal draw_pixel
	
	addi	$a0, $a0, 1	# add one to x-axis
	addi	$a1, $a1, -1	# add one to y axis
	jal pause
	jal pause
	jal draw_pixel
	
	addi	$a0, $a0, 1	# add one to x-axis
	addi	$a1, $a1, -1	# add one to y axis
	jal pause
	jal pause
	jal draw_pixel
	
	addi	$a0, $a0, 1	# add one to x-axis
	addi	$a1, $a1, -1	# add one to y axis
	jal pause
	jal pause
	jal draw_pixel
	
	addi	$a0, $a0, 1	# add one to x-axis
	addi	$a1, $a1, -1	# add one to y axis
	jal pause
	jal pause
	jal draw_pixel

	
	addi	$a0, $a0, 1	# add one to x-axis
	addi	$a1, $a1, -1	# add one to y axis
	jal pause
	jal pause
	jal draw_pixel
	
	addi	$a0, $a0, 1	# add one to x-axis
	addi	$a1, $a1, -1	# add one to y axis
	jal pause
	jal pause
	jal draw_pixel
	
	addi	$a0, $a0, 1	# add one to x-axis
	addi	$a1, $a1, -1	# add one to y axis
	jal pause
	jal pause
	jal draw_pixel
	
	addi	$a0, $a0, 1	# add one to x-axis
	addi	$a1, $a1, -1	# add one to y axis
	jal pause
	jal pause
	jal draw_pixel

	addi	$a0, $a0, 1	# add one to x-axis
	addi	$a1, $a1, -1	# add one to y axis
	jal pause
	jal pause
	jal draw_pixel
	
	addi	$a0, $a0, 1	# add one to x-axis
	addi	$a1, $a1, -1	# add one to y axis
	jal pause
	jal pause
	jal draw_pixel
	
	addi	$a0, $a0, 1	# add one to x-axis
	addi	$a1, $a1, -1	# add one to y axis
	jal pause
	jal pause
	jal draw_pixel
	
	addi	$a0, $a0, 1	# add one to x-axis
	addi	$a1, $a1, -1	# add one to y axis
	jal pause
	jal pause
	jal draw_pixel

	addi	$a0, $a0, 1	# add one to x-axis
	addi	$a1, $a1, -1	# add one to y axis
	jal pause
	jal pause
	jal draw_pixel
	
	addi	$a0, $a0, 1	# add one to x-axis
	addi	$a1, $a1, -1	# add one to y axis
	jal pause
	jal pause
	jal draw_pixel		
	
	addi	$a1, $a1, -1	# add one to y axis
	jal pause
	jal pause
	jal draw_pixel		
	
	addi	$a1, $a1, -1	# add one to y axis
	jal pause
	jal pause
	jal draw_pixel	
	
	addi	$a1, $a1, -1	# add one to y axis
	jal pause
	jal pause
	jal draw_pixel	
	
	addi	$a1, $a1, -1	# add one to y axis
	addi	$a0, $a0, 1	# add one to x-axis
	jal pause
	jal pause
	jal draw_pixel

	addi	$a1, $a1, -1	# add one to y axis
	jal pause
	jal pause
	jal draw_pixel		
	
	addi	$a0, $a0, 1	# add one to x-axis
	addi	$a1, $a1, -1	# add one to y axis
	jal pause
	jal pause
	jal draw_pixel
		
	addi	$a0, $a0, 1	# add one to x-axis
	addi	$a1, $a1, -1	# add one to y axis
	jal pause
	jal pause
	jal draw_pixel
	
	
	addi	$a0, $a0, 1	# add one to x-axis
	addi	$a1, $a1, -1	# add one to y axis
	jal pause
	jal pause
	jal draw_pixel
	
	addi	$a0, $a0, 1	# add one to x-axis
	addi	$a1, $a1, -1	# add one to y axis
	jal pause
	jal pause
	jal draw_pixel	

	addi	$a0, $a0, 1	# add one to x-axis
	addi	$a1, $a1, -1	# add one to y axis
	jal pause
	jal pause
	jal draw_pixel
		
	addi	$a0, $a0, 1	# add one to x-axis
	addi	$a1, $a1, -1	# add one to y axis
	jal pause
	jal pause
	jal draw_pixel
	
	beq	$a2, 0, goOn
	
	j switch	

left:
	li	$a2, 0	  # a2 = BLACK, black out the points
	
	lw	$a0, temp1	# put saved origin at x
	lw	$a1, temp2	# put saved origin at y
	
	addi	$a1, $a1, -7	# go to first dash on y-axis
	addi	$a0, $a0, 1	# add one to x-axis
	jal pause
	jal pause
	jal draw_pixel
	j loop1

up1:	
	# output more information
	li	$v0, 4		# output a new line
	la	$a0, newL
	syscall	
	
	li	$v0, 4
	la	$a0, msg10
	syscall
	
	li	$v0, 4		# output a new line
	la	$a0, newL
	syscall	
	
	li	$v0, 4
	la	$a0, msg11
	syscall
	
	li	$v0, 4		# output a new line
	la	$a0, newL
	syscall
	
	li	$v0, 4
	la	$a0, msg12
	syscall
	
	li	$v0, 4		# output a new line
	la	$a0, newL
	syscall
	
	li	$v0, 4
	la	$a0, msg13
	syscall
	
	li	$v0, 4		# output a new line
	la	$a0, newL
	syscall
	
	j upback1

up2:	
	# output more information
	li	$v0, 4		# output a new line
	la	$a0, newL
	syscall	
	
	li	$v0, 4
	la	$a0, msg10
	syscall
	
	li	$v0, 4		# output a new line
	la	$a0, newL
	syscall	
	
	li	$v0, 4
	la	$a0, msg11
	syscall
	
	li	$v0, 4		# output a new line
	la	$a0, newL
	syscall
	
	li	$v0, 4
	la	$a0, msg12
	syscall
	
	li	$v0, 4		# output a new line
	la	$a0, newL
	syscall
	
	li	$v0, 4
	la	$a0, msg13
	syscall
	
	li	$v0, 4		# output a new line
	la	$a0, newL
	syscall
	
	j upback2

exit:	li	$v0, 10
	syscall

#############################################################################################################################################################
# subroutine to draw a pixel
# $a0 = X
# $a1 = Y
# $a2 = color
draw_pixel:
	# s1 = address = $gp + 4*(x + y*width)
	mul	$t9, $a1, WIDTH   # y * WIDTH
	add	$t9, $t9, $a0	  # add X
	mul	$t9, $t9, 4	  # multiply by 4 to get word offset
	add	$t9, $t9, $gp	  # add to base address
	sw	$a2, ($t9)	  # store color at memory location
	jr 	$ra
