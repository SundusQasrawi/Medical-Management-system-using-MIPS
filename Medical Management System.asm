# Computer Architecture First project : Medical Management System

# Partner 1 name: Sondos Nasser Qasarwa 
# Partner 1 ID: 1210259 
# Partner 1  section : 1

#Partner 2 name: Sarah Yousef Hassouneh
#Partner 2 ID: 1210068
#Partner 2 section: 3 

.data

 fileName: .asciiz "/Users/HP/Desktop/MedicalTest.txt"
 pointers: .word 0 : 63 #Array of pinters - each pointer will hold the address of a string representing a patient test
 numberOfTests: .word 0 
 
 #Errors messages strings 
 error_open_file: .asciiz "Error in opening the file\n"
 error_read_file: .asciiz "Error in reading the file\n"
 invalid_ID: .asciiz "Invalid ID \n"
 error_option_num: .asciiz "\n Invalid option number\n" 
 invalid_year1: .asciiz "\n Invalid input year. The allowed range is 1900 - 2024\n" 
 invalid_result: .asciiz "\n Invalid test result.\n"
 error_inMonth: .asciiz "\n Invalid input month.\n"
 error_invalid_id: .asciiz "\n The id entered is invalid , it must be 7 digit number!\n"
 error_invalid_month: .asciiz "\n The month entered is invalid!\n"
 error_max_min_year: .asciiz "\n Max year can not be smaller than Min year, please try again! \n"
  
 # Add new medical test strings
 enter_ID: .asciiz "\n Enter the patient ID (Integer of 7 digits) \n " 
 enter_test_name: .asciiz "\n Choose the test name number (from 1 to 5).\n 1- HGB. \n 2- BGT.\n 3- LDL.\n 4- BPT.\n 5- RBC.\n "
 enter_year: .asciiz "\n To enter the test date: Enter the test year first.\n "
 enter_month: .asciiz "\n Enter the test month.\n " 
 enter_result: .asciiz "\n Enter the test result\n "
 enter_result2: .asciiz "\n Enter the Diastolic Blood Pressure\n "
 enter_result1: .asciiz "\n Enter the Systolic Blood Pressure result\n "
 test_added: .asciiz "\n The test is added successfully.\n "
 test_updated: .asciiz "\n The test is updated successfully.\n "
  
  
 #temp data used in adding a new test
 temp_id: .space 20 #to store the added id as string
 temp_testName: .space 4
 temp_year: .space 20 #to store the added year as strin
 temp_month: .space 3
 temp_result: .space 20
 temp_result2: .space 20 
 test_name_option : .word 0 
 
 newLine: .asciiz "\n" 
 # Display menu strings 
 welcome: .asciiz "\n\n Welcome to our  Medical Test Management System "

 menuOpts: .asciiz "\n\n Select one option: \n"
 option1: .asciiz " 1- Add a new medical test. \n"
 option2: .asciiz " 2- Search for a test by patient ID. \n"
 option3: .asciiz " 3- Search for unnormal tests. \n"
 option4: .asciiz " 4- Calculate average test value. \n"
 option5: .asciiz " 5- Update an existing test result. \n"
 option6: .asciiz " 6- Delete a test. \n" 
 option7: .asciiz " 7- Print the content of the output file. \n" 
 option8: .asciiz " 8- Save and Quit.\nYour Choice:" 
 
 ###############
 #Search menu: 
 select_mode: .asciiz "\n Select one option (1-3)\n"
 search1: .asciiz " 1- Retrieve all patient tests \n"
 search2: .asciiz " 2- Retrieve all up normal patient tests \n"
 search3: .asciiz " 3- Retrieve all patient tests in a given specific period\n Your choice: "
 result_pointers : .word 0 : 63 # Array of pionters - each pointer will hold the address of a string representing a patient test for a specific patient (given patient id )
 id_prompt: .asciiz "\n Please enter a valid patient ID : "
 no_tests_found : .asciiz "\n No Tests Found. "
 
 min_month_prompt: .asciiz "Please enter the minimum month: "
 min_year_prompt: .asciiz "Please enter the minimum year: "
 max_month_prompt: .asciiz "Please enter the maximum month: "
 max_year_prompt: .asciiz "Please enter the maximum year: "

 result: .asciiz " \nResult of search is :\n"
 end_save: .asciiz " \nSaved Successfully\n"
  
  
 choose_test_to_delete: .asciiz "\nThere is multiple tests for this patient!Choose number of test to delete\n test number: "
 choose_test_to_update: .asciiz "\nThere is multiple tests for this patient!Choose number of test to update\n test number: "
 one_found: .asciiz "\n One test is found with this id which is:\n  "
 test_deleted: .asciiz "\n The test is deleted successfully.\n"

 
 ##############
  #Test names 
 HGB_name: .asciiz "HGB"	#1
 BGT_name: .asciiz "BGT"	#2
 LDL_name: .asciiz "LDL"	#3
 BPT_name: .asciiz "BPT"	#4
 RBC_name: .asciiz "RBC"	#5
 
 
 # temp test name to compare
 temp_test_name : .space 3
 
 
 # Test Ranges (will all be asumed to be floats)
 HGB_min: .float 13.8
 HGB_max: .float 17.2
 
 BGT_min: .float 70
 BGT_max: .float 99
 
 LDL_max: .float 100
 
 BPT_max_systolic: .float 120
 BPT_max_diastolic: .float 80
 
 RBC_min: .float 4.35
 RBC_max: .float 5.65

 #  calculating average value arrays and strings
 zero: .float 0.0
 Counters_array: .word 0 : 6 # array of counters (each index store the count of a specific test )
 Sum_array: .float 0 : 6 # array of sums (each index store the sum of a specific test values )
 noHgbTests: .asciiz "\n\n Average HGB value: There are no HGB tests." 
 noBgtTests: .asciiz "\n\n Average BGT value: There are no BGT tests." 
 noLdlTests: .asciiz "\n\n Average LDL value: There are no LDL tests." 
 noBptTests: .asciiz "\n\n Average BPT value: There are no BPT tests." 
 noBgtTests1: .asciiz "\n\n HGB test Average value: There is no HGB tests." 
 noRbcTests:  .asciiz "\n\n Average RBC value: There are no RBC tests." 
 
 HGB_avg: .asciiz "\n\n Average HGB value: " 
 BGT_avg: .asciiz "\n\n Average BGT value: " 
 LDL_avg: .asciiz "\n\n Average LDL value: " 
 BPT_avg1: .asciiz "\n\n BPT test:\n Average Systolic Blood Pressure: " 
 BPT_avg2: .asciiz "\n Average Diastolic Blood Pressure: " 
 RBC_avg: .asciiz "\n\n Average RBC value: "


 # Temp strings for testing: 
 
 #done_string: .asciiz "\ndone\n"
 #search_start: .asciiz " \nsearch start here\n" 
 #equal: .asciiz " \ntwo ids are equal\n" 
 #check_range: .asciiz "\nchecking range \n"
 #check_test: .asciiz "\nchecking test\n"
 #message: .asciiz "This is the new content.\n"
 #empty: .asciiz "There is empty line"
 #hello: .asciiz "hi"

 #------------------------------------------------------------- Macros  ---------------------------------------------------------------# 

 .macro print_string (%str)
  li $v0, 4 
  la $a0, %str
  syscall  
 .end_macro 
 
 
 #------------------------------------------------------------- Start of main ----------------------------------------------------------# 

.text
.globl main

main:

  jal open_file #after calling $v0 contains the file descriptor
  move $a0, $v0 # $a0 <- file descriptor
  move $s0, $v0 # $s0 <- file descriptor
  
 jal read_file
 
 #print number of tests for testing
  #lw $a0,numberOfTests
  #li $v0, 1
  #syscall
 
  # Close the file 
    la $a0, fileName   # address of file name
    li $v0, 16          # syscall number for close
    move $a0, $s0       # file descriptor
    syscall
    
   print_string(welcome) # print welcome message at the start of the program
   
start: 
  
  print_string(menuOpts)
  print_string(option1)
  print_string(option2)
  print_string(option3)
  print_string(option4)
  print_string(option5)
  print_string(option6)
  print_string(option7)
  print_string(option8)
  
  
  li $v0,5 #read integer
  syscall 
  move $t0,$v0 # $t0 <- the input integer 
  
  # Check the validity of the option selected by user
  li $t1, 1
  li $t2, 8 
  blt $t0, $t1, invalid_menu_option
  bgt $t0, $t2, invalid_menu_option
  j cont_1
  
invalid_menu_option:
 print_string(error_option_num) 
 j start 
 
cont_1: 
  beq $t0,1,AddTest
  beq $t0,2,searchTest
  beq $t0,3,searchTestUnnormal
  beq $t0,4,findAvg
  beq $t0,5,updateTest
  beq $t0,6,delete 
  beq $t0,7, printOutput
  beq $t0,8,save
  
searchTestUnnormal:
   jal all_unnormal_option
   j start 
   
 updateTest:
   jal update_option
   j start 
    
searchTest:
   li $a1, 2
  jal search_option
  j start 

delete:
   jal DeleteTest
   j start 
findAvg: 
  jal Average_Test_Value
  j start 
 printOutput:
    jal print_output_file_content
    j start
 save:    	
     jal Save
    	
 #End the program
end: 
  li $v0,10 #sytem call to end the program
  syscall

  #------------------------------------------------------------- End of main ---------------------------------------------------------------# 
  
  
  #-------------------------------------------------------------Functions ------------------------------------------------------------------# 
   
############## Save Records to file  ###############

Save: 
  #open file 
    	li $v0,13           	# open_file syscall code = 13
    	la $a0,fileName     	# get the file name
    	li $a1,1           	# file flag = write (1)
    	syscall
    	move $s1,$v0        	# save the file descriptor. $s0 = file
    	

    	#Write the records
    	#-----------------------------------------------------#
    	
   	la $t3, pointers
   	
 save_record:   	
 	lw $t0,0($t3)  
  	beqz $t0, done_saving  
  
  
  	# calculate string length:
  
   		# Initialize register
   		move $t1, $t0
    		li $t2, 0       # Initialize the counter to 0

		next_char:
    		lb $t4, 0($t1)  # Load the current character from the string
    		beq $t4, 0, end_string # If the character is null (end of string), exit loop
    		addi $t2, $t2, 1  # Otherwise, increment the counter
    		addi $t1, $t1, 1  # Move to the next character
    		j next_char           # Jump back to the loop start

		end_string:


   	# write string to file 
   	li $v0,15		# write_file syscall code = 15
    	move $a0,$s1		# file descriptor
    	move $a1,$t0		# the string that will be written
    	move $a2,$t2
    	#la $a2,50		# length of the string
    	syscall
    
   	addi $t3, $t3, 4

   	j  save_record
 
	
    	#-----------------------------------------------------#
done_saving:

  	print_string(end_save)
  	print_string(newLine)
  	
	#MUST CLOSE FILE IN ORDER TO UPDATE THE FILE
    	li $v0,16         		# close_file syscall code
    	move $a0,$s1      		# file descriptor to close
    	syscall
         jr $ra 
 
                 
############## Add a new medical test ###############
            
AddTest:

 print_string(enter_ID)
 li $v0,8 #System call for reading string (The integer will be read as string then converted to integer)
 la $a0,temp_id
 li $a1,20 #maximum number of charecters to read
 syscall  
 la $a0,temp_id 
 jal str2int
 move $t0,$v0
 # To check the validty of th input integer
 li $t0, 1000000 # min valid id
 li $t1, 9999999 # max valid id
 move $t2,$v0 # $t2 <- input integer
 blt $t2,$t0,invalid_id  
 bgt $t2,$t1,invalid_id
 j Continue
 
invalid_id: 
    print_string(invalid_ID) 
    j AddTest
   
Continue: #to add the test name
    print_string(newLine) 
    print_string(enter_test_name) 
    li $v0, 5 #syscall for read integer (1 for Hgb. 2 for BGT. 3 for LDL. 4 for BPT.)
    syscall # the input number is in $v0 
    move $t0,$v0 # $t0 <- the input number 
    blt $t0,1,invalid_option
    bgt $t0,5,invalid_option 
    la $t1, test_name_option
    sw $t0, 0($t1)
    move $a0,$t0 
    jal store_testName
    j addYear
invalid_option: 
     print_string(error_option_num)
     j Continue 
addYear: 
    print_string(enter_year)
    li $v0,8 #System call for reading string (The integer will be read as string then converted to integer)
    la $a0,temp_year
    li $a1,20 #maximum number of charecters to read
    syscall  
    la $a0,temp_year
    jal str2int
    move $t0,$v0
    # To check the validty of th input year
    li $t0, 1900 # min year
    li $t1, 2024# max year
    move $t2,$v0 # $t2 <- input integer
    blt $t2,$t0,invalid_year 
    bgt $t2,$t1,invalid_year
    j addMonth
invalid_year: 
    print_string(invalid_year1) 
    j addYear
addMonth: 
    print_string(enter_month)
    li $v0, 5 #syscall for read integer 
    syscall # the input number is in $v0 
    move $t0,$v0 # $t0 <- the input number 
    blt $t0,1,invalid_month
    bgt $t0,12,invalid_month
    move $a0,$t0 
    jal store_testMonth
    j addResult
invalid_month: 
     print_string(error_inMonth)
     print_string(newLine) 
     j addMonth
addResult:
    la $t1, test_name_option
    lw $t0,0($t1)
    beq $t0, 4, add_BPT_result
    print_string(enter_result)
    li $v0,8 #System call for reading string (The result will be read as string then converted to integer)
    la $a0,temp_result
    li $a1,10 #maximum number of charecters to read
    syscall
    la $a0,temp_result
    jal is_float
    move $t0,$v0
    beqz $t0, invalid_result_format
    j STest
    invalid_result_format: 
    print_string(invalid_result)
   j addResult
add_BPT_result: 
    print_string(enter_result1)
    li $v0,8 #System call for reading string (The result will be read as string then converted to integer)
    la $a0,temp_result
    li $a1,10 #maximum number of charecters to read
    syscall
    la $a0,temp_result
    jal is_float
    move $t0,$v0
    beqz $t0, invalid_result1_format
    j add_result2
invalid_result1_format: 
   print_string(invalid_result)
   j add_BPT_result
   
add_result2:
   print_string(enter_result2)
    li $v0,8 #System call for reading string (The result will be read as string then converted to integer)
    la $a0,temp_result2
    li $a1,10 #maximum number of charecters to read
    syscall
    la $a0,temp_result2
    jal is_float
    move $t0,$v0
    beqz $t0, invalid_result2_format
    j STest
invalid_result2_format: 
    print_string(invalid_result)
    j add_result2 
STest: 
    jal storeTest 
    print_string(test_added)
    
    j start


############## Open File Function ###############

open_file: 

    #save the value of the return address in reg t0 because the system call might change the return adderss internally
    move $t0, $ra
    li $v0,13 #System call for opening the file
    la $a0,fileName #a0 contains the address of the fileName
    li $a1,0 #a1 contains flag (0 for read) 
    li $a2,0 # mode is ignored in read 
    syscall
    bltz $v0 Error_opening_file #if $v0 is negative if error 
    #move $s0,$v0 #move the file descriptor in $s0 
    move $ra, $t0
    jr $ra
 
       
############## Read File Function ###############

read_file: 
  li $t3,0 # initialize counter to traverse lines in file
  la $t4,pointers #$t4 <- address of pointers array
  move $t2,$a0 #Save fd
outer_loop:
  li $a0, 50 #number of bytes to allocate 
  li $v0, 9 #System call to allocate heap memory
  syscall
  move $t0,$v0 #the address of the allocated memory
  sll $t5,$t3,2 #$t5 = $t3 * 4 (to calculate the displacment from the base address)
  addu $t5,$t5,$t4 #$t5 = pointers + 4*lineNumber 
  sw $t0,0($t5)
  move $a0,$t2 #fd
loop:
    move $a1,$t0
    li $v0, 14
    li $a2, 1     
    syscall  
    
      bltz $v0 Error_reading_file #if $v0 is negative if error        
      beqz $v0,endRead  
      lb $t1,0($t0)
      addi $t0,$t0,1
     # beq $t1, '\r', endLine
      beq $t1, '\n', endLine
      j loop

endLine: 
     sb $0,0($t0) #store null terminator
     subi $sp, $sp, 4
     sw $ra, 0($sp)
     move $a0,$t5 # move the address of the line to $a0
     jal is_empty_line
     lw $ra, 0($sp)
     addi $sp, $sp, 4
     beq $v1,1, deleteEmptyLine
    # beqz $v0,endRead #if EOF -> $v0 = 0 
     addi $t3,$t3,1 #increment counter (number of lines)
     j outer_loop
deleteEmptyLine:
    sw $0,0($t5) # delete its address in the pointers array
    j endRead
endRead:
    #addi $t3,$t3,1 
    la $t6, numberOfTests
    sw $t3, 0($t6)
    jr $ra
    
    
############## Is Empty Function ###############

#checks if any line in file is empty

# a1 contains the address of the line in memory
# v1 returns 1 if line is empty. and 0 if line is not empty
is_empty_line: 
 
 lw $a0, 0($a0)
 li $t7,0 #counter of non white space characters
loopA:
 lb $t8,0($a0)
 beqz $t8,check_empty #check the number of non white space chars at the end of line
 beq $t8, ' ', nextChar
 beq $t8, '\n',nextChar
 beq $t8, '\r', nextChar
 
 addi $t7,$t7,1
 
nextChar: 
 addi $a0,$a0,1
  j loopA
check_empty:
  beqz $t7, emptyL
  bnez $t7, not_empty 
emptyL: 
  li $v1, 1
  jr $ra
not_empty:
  li $v1, 0
  jr $ra
  
  
############## Convert String to Integer Function ###############

str2int: 
    #Convert string into unsigned int 
    #a0 contains the address of string
    #$v0 stores the unsigned integer value
    li $v0, 0 # intialize $v0 = 0 
    li $t0, 10 #$t0 = 10
 loop1:
    lb $t1, 0($a0) #load char
    blt $t1,'0',done
    bgt $t1, '9',done
    addiu $t1, $t1, -48
    mul $v0, $v0, $t0 # v0 = v0*10
    addu $v0, $v0, $t1 # v0 = V0 + digit
    addi $a0, $a0,1 #increment the index to next char 
    j loop1 
  done: 
    jr $ra
    
############## Extract Test Name from Test ###############

#a0 contains a number (1 for Hgb. 2 for BGT. 3 for LDL. 4 for BPT)
#the function takes a number in a0 and store the name as string in temp_testName
store_testName: 

    beq $a0,1,Hgb
    beq $a0,2,BGT
    beq $a0,3,LDL
    beq $a0,4,BPT
    beq $a0,5,RBC
Hgb: 
    la $a1, temp_testName 
    la $a0, HGB_name
    j contStore
  #########################  
LDL: 
    la $a1, temp_testName 
    la $a0, LDL_name
    j contStore
   ##################### 
BPT: 
   la $a1, temp_testName 
   la $a0, BPT_name
   j contStore
    ######################
BGT: 
    la $a1, temp_testName 
    la $a0, BGT_name
     j contStore
    ####################
 RBC: 
    la $a1, temp_testName 
    la $a0, RBC_name

contStore:
    subi $sp, $sp , 4
    sw $ra, 0($sp)
    jal copy_string
    lw $ra, 0($sp)
    addi $sp, $sp , 4
 jr $ra   
 
 
############## Copy String Function ###############

 copy_string: 
 # Function that takes an address of a string in $a0 and copy the string in the address of a1
  move $t0, $a0 
  move $t3, $a1
 cpy_Loop:
    lb $t1, 0($t0)
    beqz $t1, end_copy
    sb $t1,0($t3)
    addi $t0, $t0, 1
    addi $t3, $t3, 1  
    j cpy_Loop 
   end_copy:
    jr $ra 
    
############## Store Test Function ###############

storeTest: 
  li $a0, 50 #number of bytes to allocate 
  li $v0, 9 #System call to allocate heap memory
  syscall
  move $t0,$v0 #the address of the allocated memory
  la $t1,numberOfTests
  la $t4, pointers
  lw $t3,0($t1)
  sll $t5,$t3,2 #$t5 = $t3 * 4 (to calculate the displacment from the base address)
  addu $t5,$t5,$t4 #$t5 = pointers + 4*lineNumber 
  sw $t0,0($t5)
  
  li $t1,7 #counter to traverse the id string
  la $t2, temp_id 

L:
  lb $t3,0($t2) #load character
  sb $t3,0($t0)
  addiu $t0,$t0,1
  addiu $t2,$t2,1
  addiu $t1,$t1,-1
  beqz $t1,L1
  j L
  
L1: 
  li $t3,':'
  sb $t3,0($t0)
  addiu $t0,$t0,1
  li $t3,' '
  sb $t3,0($t0)
  addiu $t0,$t0,1

  li $t1,3 #counter to traverse the testName string
  la $t2, temp_testName 
L2:
  lb $t3,0($t2) #load character
  sb $t3,0($t0)
  addiu $t0,$t0,1
  addiu $t2,$t2,1
  addiu $t1,$t1,-1
  beqz $t1,L3
  j L2
L3: 
  li $t3,','
  sb $t3,0($t0)
  addiu $t0,$t0,1
  li $t3,' '
  sb $t3,0($t0)
  addiu $t0,$t0,1 
  li $t1,4 #counter to traverse the year string
  la $t2, temp_year
L4:
  lb $t3,0($t2) #load character
  sb $t3,0($t0)
  addiu $t0,$t0,1
  addiu $t2,$t2,1
  addiu $t1,$t1,-1
  beqz $t1,L5
  j L4
L5: 
  li $t3,'-'
  sb $t3,0($t0)
  addiu $t0,$t0,1
  
  la $t2, temp_month 
  lb $t3,0($t2)
  sb $t3,0($t0)
  addiu $t0,$t0,1
  lb $t3,1($t2)
  sb $t3,0($t0)
  addiu $t0,$t0,1
  
  li $t3,','
  sb $t3,0($t0)
  addiu $t0,$t0,1
  li $t3,' '
  sb $t3,0($t0)
  addiu $t0,$t0,1 
  
  la $t2, temp_result
L6:
  lb $t3,0($t2) #load character
  beq $t3,10,L7
  sb $t3,0($t0)
  addiu $t0,$t0,1
  addiu $t2,$t2,1
  j L6
  
L7: 
    la $t6, test_name_option
    lw $t5,0($t6)
    beq $t5,4,res2
    j endFun
res2:
    li $t3,','
    sb $t3,0($t0)
    addiu $t0,$t0,1
    li $t3,' '
    sb $t3,0($t0)
    addiu $t0,$t0,1
    la $t2, temp_result2
L8:
  lb $t3,0($t2) #load character
  beq $t3,10,endFun
  sb $t3,0($t0)
  addiu $t0,$t0,1
  addiu $t2,$t2,1
  
  j L8
endFun: 
   lw $t1, numberOfTests
   addi $t1, $t1, 1
   sw $t1, numberOfTests
   #load character
   li $t1 ,'\n'
   sb $t1, 0($t0)
   addiu $t0,$t0,1
  sb $0,0($t0)
  jr $ra 
  
  
############## Store Test Month Function ###############

store_testMonth: #a0 contains the month "int" and store it as string in temp_month
  la $t0, temp_month
  li $t1,10 
  divu $a0,$t1
  mflo $t2 #t2 = month/10
  mfhi $t3 #t3 = month % 10 
  addiu $t2,$t2,48
  addiu $t3,$t3,48
  sb $t2,0($t0)
  sb $t3,1($t0)
  jr $ra
  
  
############## Convert String to float Function ###############

str2float: 
    #Convert string into float
    
    #a0 contains the address of string
    #$f0 stores the single-percision float value
    
    #intilaize fo to 0	
    li $t0, 0           
    mtc1 $t0, $f0       # Move the value from $t0 to $f0 (convert integer to floating-point)

  
    li $t0, 10 #$t0 = 10
    li $t1, 0 # t1 will have the current chraccter 
    
    li $t2 , 0 # the integer part
    li $t3 , 0 # the decimal part
    
    li $t4 , 0 # flag of decimal point
    li $t5 , 1 # divide by this amount
    
    
 loopf:
    lb $t1, 0($a0) #load char
    
    beq $t1,'.',decimal_point
    blt $t1,'0',donef
    bgt $t1, '9',donef
    b cont
    
decimal_point:
  li $t4, 1 
  b next
   
cont:
    addiu $t1, $t1, -48
    
    # see if integer or decimal
    bne $t4, 0, decimal_part
  
integer_part:      
    mul $t2, $t2, 10 # t2 = t2*10
    addu $t2, $t2, $t1 # t2 = t2 + digit
    b next 
    
decimal_part:  
    	mul $t3, $t3, 10 
    	addu $t3, $t3, $t1 
        mul $t5, $t5, 10
        
 next:    
    addi $a0, $a0,1 #increment the index to next char 
    j loopf
           
  donef: 
  
      # Convert the result to a float
      
    	# Convert the result to a float
	mtc1 $t2, $f2      
	cvt.s.w $f2, $f2  

	# Convert the result to a float
	mtc1 $t3, $f3      
	cvt.s.w $f3, $f3   

	# Convert the result to a float
	mtc1 $t5, $f5       
	cvt.s.w $f5, $f5   
      
    	# Calculate the float result
    	div $t3, $t3, $t5   # t3 = t3 / t5
   	addu $t2, $t2, $t3  # t2 = t2 + (t3 / t5)
   	
       div.s $f0, $f3, $f5
       add.s $f0, $f0, $f2
      
    jr $ra


############## Check float Function ###############


is_float: #function resturn adress of string in a0 and check if is it in float format
 # if string represents a floating-point number then $v0 stores 1. otherwise it is 0. 
 li $v0,1 #initialize v0 
 move $t0, $a0 #t0 <- address of the string 
loop_1:
 lb $t4,0($t0) #load character
 beqz $t4,is_float_done #end of the string
 beq $t4,10,is_float_done #end of the string
 # if the character is not in range ('0' - '9' ) then check if is a decimal point
 bgt $t4,'9',is_decimal_point
 blt $t4,'0',is_decimal_point
 addiu $t0,$t0,1 #move to next char
 j loop_1
 
is_decimal_point:
 bne $t4,'.', not_float
 addiu $t0,$t0,1 # move to next char
 j loop_1
 
not_float: 
  li $v0,0 

  jr $ra
is_float_done:
  jr $ra
  
  
############## Handle search Function ###############


  # Handle all the search option here
 search_option :

	#print_string (search_start)
 
 enter_id:
  
  # ask user to enter an id 
  print_string (id_prompt)
   
  # read the id 
  li $v0, 5      # syscall code for reading integer
  syscall       
  bltz $v0, Error_invalid_id #if $v0 is negative if error       
  move $t1, $v0  

  # check if id is valid ( 7 digits)
  bltu $t1,1000000, Error_invalid_id
  bgtu $t1,9999999, Error_invalid_id

  # check print the integer read (for testing purpose only)
  #li $v0, 1         # syscall code for printing integer
   #move $a0, $t1    
  #syscall
  
 #....
print_search_options:
 
  print_string(select_mode)
  print_string(search1)
  print_string(search2)
  print_string(search3)
  
 #....
 li $v0,5 #read integer
 syscall 
 move $a1,$v0
 bltu $a1,1,invalid_search_mode
 bgtu $a1,3,invalid_search_mode
 j cont_search
 
invalid_search_mode:
 print_string(error_option_num)
 j print_search_options
 

cont_search:
 # call the search function 
 move $a0,$t1		# load id 
 #a1 -> search mode
 	
 	
 	
 	# before jumping , save the return address ($ra) onto the stack
	subi $sp, $sp, 4    # adjust the stack pointer 
	sw $ra, ($sp)       # store the value


		jal search_by_id  # this function fills the result_pointers array
    
    
    	# after returning  restore $ra from the stack
	lw $ra, ($sp)       # load the value of $ra from the stack
	addi $sp, $sp, 4    # Adjust the stack 
   
  
 # print result of search 

  
      # before jumping , save the return address ($ra) onto the stack
	subi $sp, $sp, 4    # adjust the stack pointer 
	sw $ra, ($sp)       # store the value


		jal  print_result  # this function fills the result_pointers array
    
    
    	# after returning  restore $ra from the stack
	lw $ra, ($sp)       # load the value of $ra from the stack
	addi $sp, $sp, 4    # Adjust the stack 
	
	
  jr $ra
         
                       
                                     
                                                                 
############## Main search Function ###############
             
# search functionallity by patient id ( This function has two arguments )
# $a0 has patient id and $a1 has search mode  
# 1 -> the search result has all tests that matches patient id
# 2 -> the search result has all tests that matches patient id & the search result is normal
# 3 -> the search result has all tests that matches patient id & the search date is in range of period specified in ( $s2, $s3, $s4, $s5)

                  
search_by_id : 
move $t8,$a1 # search mode
li $t0,0 # flag for additional conditions in search mode 2 and 3
  
 move $s1,$a0 # save address to look for in s1
 
 bne $t8,3,start_search # if mode is not 3 you do not need to read month and ranges
 
 enter_range: 
 
 print_string(newLine)
 #enter min year
min_year:

 	print_string (min_year_prompt)
  	li $v0, 5      # syscall code for reading integer
  	syscall       
  	  
    	# To check the validty of th input year
   	li $t3, 1900 # min year
    	li $t4, 2024# max year
    	move $t2,$v0 # $t2 <- input integer
    	blt $t2,$t3,invalid_year2 
    	bgt $t2,$t4,invalid_year2
    	move $s2, $t2
    	j min_month

   invalid_year2: 
    	print_string(invalid_year1) 
    	j min_year
    	
   
 #enter min month 
min_month:
		
   print_string (min_month_prompt)
   
  li $v0, 5      # syscall code for reading integer
  syscall       
  move $t2, $v0  
 
 bltu $t2,1, Error_invalid_min_month
 bgtu $t2,12, Error_invalid_min_month
 
  move $s3, $v0  
 
 #enter max year
max_year:

	print_string (max_year_prompt)
  	li $v0, 5      # syscall code for reading integer
  	syscall       
  	  
    	# To check the validty of th input year
   	li $t3, 1900 # min year
    	li $t4, 2024# max year
    	move $t2,$v0 # $t2 <- input integer
    	blt $t2,$t3,invalid_year3 
    	bgt $t2,$t4,invalid_year3
    	
    	#ensure max year > min year
    	move $t5,$s2
    	blt $t2,$t5,max_smaller
    	move $s4, $t2
    	j max_month

    max_smaller:
  	print_string(error_max_min_year) 
  	j min_year
  	    	
    invalid_year3: 
    	print_string(invalid_year1) 
    	j max_year
    	 
  
  
#enter max month
max_month:

   print_string (max_month_prompt)
   
  li $v0, 5      # syscall code for reading integer
  syscall       
  move $t2, $v0  
 
 bltu $t2,1, Error_invalid_max_month
 bgtu $t2,12, Error_invalid_max_month
    
 move $s5, $v0     

# start search and loop on tests 
start_search:       
 
  la $t3, pointers # start looking for tests
  la $t4, result_pointers
      
      
  loop_tests: 
  
    li $t0,0 # reset flag   
    lw $a0, 0($t3)  
    move $t6, $a0 #save address of test
    beqz $a0, end_search  # Branch if the pointer is null

   	# before jumping , save the return address ($ra) onto the stack
	subi $sp, $sp, 4    # adjust the stack pointer 
	sw $ra, ($sp)       # store the value

    jal str2int     # get id of test 
    move $t1, $v0    
    
    	# after returning  restore $ra from the stack
	lw $ra, ($sp)       # load the value of $ra from the stack
	addi $sp, $sp, 4    # Adjust the stack 


    # compare it 
     addi $t3, $t3, 4  # each pointer is 4 bytes 
     bne $s1,$t1,  loop_tests # go to next test if not equal 
          # else set flag to 1
          li $t0, 1 
  
  # save address of test
  move $a0,$t6
  
   #then check additional conditions when mode ($t8) = 2 or 3
                                                                
    beq $t8,2, go_check_test
    beq $t8,3, go_check_date
    b after_check


go_check_test: 
# before jumping , save the return address ($ra) onto the stack
	subi $sp, $sp, 12   # adjust the stack pointer 
	sw $ra, ($sp)       # store the value
	sw $t2, 4 ($sp)  
	sw $t1, 8 ($sp)  

    move $a0,$t6	
    jal check_test_range    
    #li $t0, 1    # set flag ---> remove this
    
    
    	# after returning restore $ra from the stack
	lw $ra, ($sp)       # load the value of $ra from the stack
	lw $t2, 4($sp) 
	lw $t1, 8($sp)         
	addi $sp, $sp, 12    # Adjust the stack 
  
   xor $v0, $v0, 1 # for upnormal tests
   move $t0, $v0    # set flag
   
b after_check 
 		
go_check_date: 
# before jumping , save the return address ($ra) & ($t3)  onto the stack
	subi $sp, $sp, 12    # adjust the stack pointer 
	sw $ra, ($sp)       # store the value
	sw $t3, 4($sp)      # store the value of $t3
        sw $t2, 8($sp)      # store the value of $t3

    jal check_date_range    
    move $t0, $v0    # set flag
    
    	# after returning restore $ra from the stack
	lw $ra, ($sp)       # load the value of $ra from the stack
	lw $t3, 4($sp)      # load the value of $t3 from the stack
	lw $t2, 8($sp)      # load the value of $t2 from the stack
	addi $sp, $sp, 12    # Adjust the stack

												
after_check: 
   
    #li $t0, 1 # remove this *****   
    
    # recheck flag
    bne $t0,1, loop_tests
   
    sw $t6, 0($t4) # store address of equal test in patient pointers
    addi $t4, $t4, 4  # each pointer is 4 bytes 

    
    b loop_tests # got to next test
    
                       
end_search: 
   sw $0, 0($t4) #   # save null terminator at last     
   jr $ra
    
    
############## Print Result Function ###############
 
 # function to print result array 
 print_result:
 
 
 
 # print all records in result if not empty 
   la $t4, result_pointers
   lw $t0,0($t4)  
   beqz $t0, no_records  # No records if first one is null
  
   
   li $t1, 1 # counter for lines 
   print_string(result)   
 
print_loop:
   
      
   lw $t0,0($t4)   
   beqz $t0, tests_done  # Branch if the pointer is null   
   
   
    li $v0, 1           # syscall code for printing integer
    move $a0, $t1       
    syscall             


    li $v0, 11          # syscall code for printing character
    li $a0, ')'        
    syscall          
    
   
   #print record
   
   li $v0, 4 
   move $a0, $t0
   syscall
  
   addi $t4, $t4, 4
   addi $t1, $t1, 1  
   j print_loop 
 
   b tests_done 
  
         
no_records: 
    print_string(no_tests_found) 

    
 tests_done:  
    jr $ra
    
    
############## Check Test Range Function ###############

# function that return if test is normal or not 
# accept $a0 as address of test
# return $v0 if 1 then it is normal


check_test_range:


	move $t0,$a0 # t0 has address of test
	
	#print_string(check_test) 

	
	
	# before jumping , save the return address ($ra)
	subi $sp, $sp, 12    # adjust the stack pointer 
	sw $ra, ($sp)       # store the value
	sw $t0, 4($sp)      
      	sw $t1, 8($sp)     
      	
    move $a0, $t0
    jal  extract_test_name  # fill the temp_test_name    

    	# after returning restore $ra from the stack
	lw $ra, ($sp)       # load the value of $ra from the stack
	lw $t0, 4($sp)      # load the value of $t2 from the stack
	lw $t1, 8($sp)      # load the value of $t2 from the stack
	addi $sp, $sp, 12    # Adjust the stack
	
	
	# now test is extracted
	
			    		    	
	# before jumping , save the return address ($ra) & ($t3)  onto the stack
	subi $sp, $sp, 28   # adjust the stack pointer 
	sw $ra, ($sp)       # store the value
	sw $t0, 4($sp)     
        sw $t1, 8($sp)     
        sw $t2, 12($sp)     
        sw $t3, 16($sp)    
        sw $t4, 20($sp)
        sw $t5, 24($sp)          
        
    la $a0,temp_test_name
    jal  get_test_number    
   
    
    	# after returning restore $ra from the stack
	lw $ra, ($sp)       # load the value of $ra from the stack
	lw $t0, 4($sp)     
	lw $t1, 8($sp)     
	lw $t2, 12($sp)     
	lw $t3, 16($sp)     
	lw $t4, 20($sp)     
	lw $t5, 24($sp)      
	addi $sp, $sp, 28    # Adjust the stack

     move $t1,$v0


#get function result
	addiu $t0,$t0,23 # the 23th byte of the test

    move $a0,$t0
    
	# before jumping , save the return address ($ra) & ($t3)  onto the stack
	subi $sp, $sp, 28   # adjust the stack pointer 
	sw $ra, ($sp)       # store the value
	sw $t0, 4($sp)     
        sw $t1, 8($sp)     
        sw $t2, 12($sp)     
        sw $t3, 16($sp)    
        sw $t4, 20($sp)
        sw $t5, 24($sp)          
        
    jal  str2float  
    mov.s $f1,$f0
    
    	# after returning restore $ra from the stack
	lw $ra, ($sp)       # load the value of $ra from the stack
	lw $t0, 4($sp)     
	lw $t1, 8($sp)     
	lw $t2, 12($sp)     
	lw $t3, 16($sp)     
	lw $t4, 20($sp)     
	lw $t5, 24($sp)      
	addi $sp, $sp, 28    # Adjust the stack


# $t1 has function number 

# check if there is another float result when BPT (number 4)
	bne  $t1, 4 , handle_test_ranges
	# else find (,) seperator then get next result
find_comma:
	lb $t2, ($t0)
	addi $t0, $t0,1
	beq $t2, 0 , handle_test_ranges # no another value
	bne $t2,',',find_comma
	
	addi $t0, $t0,1
	
	# before jumping , save the return address ($ra) & ($t3)  onto the stack
	subi $sp, $sp, 28   # adjust the stack pointer 
	sw $ra, ($sp)       # store the value
	sw $t0, 4($sp)     
        sw $t1, 8($sp)     
        sw $t2, 12($sp)     
        sw $t3, 16($sp)    
        sw $t4, 20($sp)
        sw $t5, 24($sp)          
        
    move $a0,$t0
    jal  str2float  
    mov.s $f2,$f0
    
    	# after returning restore $ra from the stack
	lw $ra, ($sp)       # load the value of $ra from the stack
	lw $t0, 4($sp)     
	lw $t1, 8($sp)     
	lw $t2, 12($sp)     
	lw $t3, 16($sp)     
	lw $t4, 20($sp)     
	lw $t5, 24($sp)      
	addi $sp, $sp, 28    # Adjust the stack
	
	  

	 # we have valuee in $f1 and another value on $f2	 

	
	
handle_test_ranges:
# asume first it is normal
	li $v0,1
	
# handle each test :
	beq $t1, 1, case_1
	beq $t1, 2, case_2
	beq $t1, 3, case_3	
	beq $t1, 4, case_4	
	beq $t1, 5, case_5


       # checking HGB 
	case_1:
	 
	 l.s $f3, HGB_min
	 c.lt.s $f1, $f3   # compare if $f1 < $f3
	 bc1t  not_normal
	 
	 l.s $f3, HGB_max
	 c.lt.s $f3, $f1   # compare if $f3 < $f1
	 bc1t  not_normal
	  
	b end_case
	
	#checking BGT
	case_2:
	
	 l.s $f3, BGT_min
	 c.lt.s $f1, $f3   # compare if $f1 < $f3
	 bc1t  not_normal
	 
	 l.s $f3, BGT_max
	 c.lt.s $f3, $f1   # compare if $f3 < $f1
	 bc1t  not_normal
	   
	b end_case
	
	#checking LDL
	case_3:
	
	l.s $f3, LDL_max
	c.lt.s $f3, $f1   # compare if $f3 < $f1
	bc1t  not_normal
	
	b end_case
	
	#checking BPT
	case_4:
	
	l.s $f3, BPT_max_systolic
	c.lt.s $f3, $f1   # compare if $f3 < $f1
	bc1t  not_normal
	
	l.s $f3, BPT_max_diastolic
	c.lt.s $f3, $f2   # compare if $f3 < $f2
	bc1t  not_normal
	
	b end_case
	
	#checking RBC
	case_5:	
	
	 l.s $f3, RBC_min
	 c.lt.s $f1, $f3   # compare if $f1 < $f3
	 bc1t  not_normal
	 
	 l.s $f3, RBC_max
	 c.lt.s $f3, $f1   # compare if $f3 < $f1
	 bc1t  not_normal
	 
	b end_case

not_normal:
	li $v0,0
	
end_case:		

jr $ra


############## Extract Test Name Function ###############

# give address of test it fills  (temp_test_name)
#a0 contains the address start of string test
#all assumed capital

extract_test_name:
   
   addiu $a0,$a0,9 # the 9th byte of the test
   la $t0,temp_test_name

   
 loop2:
    lb $t1, 0($a0) #load char
    blt $t1,'A',done
    bgt $t1, 'Z',done
   
    sb $t1, ($t0)    # Store the character in $t1 at the memory location pointed to by $t2

    addi $a0, $a0,1 #increment the index to next char 
    addi $t0, $t0,1 
    
    j loop2 
    
    
  done2: 
    jr $ra
    
  
############## Get test number Function ###############

# function to get test number given string representation
# a0 is address of string representation of the test (the test RBC or HGB ...)
# vo is test number
 
  
 get_test_number:

 # save address 
la $t5 , ($a0)

check1:
	# check HGB :
	la $t1,HGB_name
	li $t4,0
	move $t0,$t5
	
   loopt_1:
   	beq $t4, 3,found_1
   	
	lb $t2, 0($t1)
	lb $t3, 0($t0)
	
	bne $t2,$t3, check2 # check next test 
	
	#else
	addi $t0, $t0,1 
	addi $t1, $t1,1 
	addi $t4, $t4,1 
	b loopt_1
	
   found_1:
	li $v0,1
	b return
#---------------------#
check2:
	# check BGT :
	la $t1,BGT_name
	li $t4,0
	move $t0,$t5
	
   loopt_2:
   	beq $t4, 3,found_2
   	
	lb $t2, 0($t1)
	lb $t3, 0($t0)
	
	bne $t2,$t3, check3 # check next test 
	
	#else
	addi $t0, $t0,1 
	addi $t1, $t1,1 
	addi $t4, $t4,1 
	b loopt_2
	
   found_2:
	li $v0,2
	b return

#---------------------#
check3:
	# check LDL :
	la $t1,LDL_name
	li $t4,0
	move $t0,$t5
	
   loopt_3:
   	beq $t4, 3,found_3
   	
	lb $t2, 0($t1)
	lb $t3, 0($t0)
	
	bne $t2,$t3, check4 # check next test 
	
	#else
	addi $t0, $t0,1 
	addi $t1, $t1,1 
	addi $t4, $t4,1 
	b loopt_3
	
   found_3:
	li $v0,3
	b return
	
#---------------------#

check4:
	# check BPT :
	la $t1,BPT_name
	li $t4,0
	move $t0,$t5
	
   loopt_4:
   	beq $t4, 3,found_4
   	
	lb $t2, 0($t1)
	lb $t3, 0($t0)
	
	bne $t2,$t3, check5 # check next test 
	
	#else
	addi $t0, $t0,1 
	addi $t1, $t1,1 
	addi $t4, $t4,1 
	b loopt_4
	
   found_4:
	li $v0,4
	b return

#---------------------#
check5:
	# check RBC :
	la $t1,RBC_name
	li $t4,0
	move $t0,$t5
	
   loopt_5:
   	beq $t4, 3,found_5
   	
	lb $t2, 0($t1)
	lb $t3, 0($t0)
	
	bne $t2,$t3,no_test # no test
	
	#else
	addi $t0, $t0,1 
	addi $t1, $t1,1 
	addi $t4, $t4,1 
	b loopt_5
	
   found_5:
	li $v0,5
	b return
	
#---------------------#	
no_test:
	li $v0,0
return:
jr $ra


############## Check Date Range of Test Function ###############

# function that return if test is in the date range specifies
# accaept $a0 as address of test
# return $v0 if 1 then it is in the range
# uses the pre-saved values in ( $s2, $s3, $s4, $s5)

check_date_range:  


	move $t3, $a0
	move $t2, $a0
	
	#print_string(check_test) 
	
			
	# get year					
	addiu $t3,$t3,14		    
  	move $a0, $t3  
  	   		
	# before jumping , save the return address ($ra) onto the stack
	subi $sp, $sp, 4    # adjust the stack pointer 
	sw $ra, ($sp)       # store the value

    jal str2int     # get id of test 
    move $t3, $v0    
    
    	# after returning  restore $ra from the stack
	lw $ra, ($sp)       # load the value of $ra from the stack
	addi $sp, $sp, 4    # Adjust the stack 
	
	
	#testing	
	#li $v0, 1         # syscall code for printing integer
  	#move $a0, $t3    
  	#syscall	
  	
  	
  	# get month					
	addiu $t2,$t2,19		    
  	move $a0, $t2 	
  	
  	
  	# before jumping , save the return address ($ra) onto the stack
	subi $sp, $sp, 4    # adjust the stack pointer 
	sw $ra, ($sp)       # store the value

    jal str2int     # get id of test 
    move $t2, $v0    
    
    	# after returning  restore $ra from the stack
	lw $ra, ($sp)       # load the value of $ra from the stack
	addi $sp, $sp, 4    # Adjust the stack 
	
	
	#testing	
	#li $v0, 1         # syscall code for printing integer
  	#move $a0, $t2    
  	#syscall	
  	
  			
  	# Now compare (t2 month and t3 year)
  	#set flag $vo to 1
  	li $v0,1 # assume it is in rane 
  	
  	# first lower boundury of year
  	blt $t3,$s2,out_of_range
  	bgt $t3,$s2,check_high
  	
  	# if equal check month
  	blt $t2,$s3,out_of_range
  	 	 	
check_high:  	 				
  	# first upper boundury of year
  	bgt $t3,$s4,out_of_range
  	blt $t3,$s4,end_range_test
  	
  	# if equal check month
  	bgt $t2,$s5,out_of_range
  	
  	b end_range_test												
  
 out_of_range:
   	li $v0,0 #set flag to zero
 
end_range_test: 																						 																						 					
jr $ra


############## Delete Test Function ###############

DeleteTest: 

  print_string (id_prompt)
  # read the id 
  li $v0, 5      # syscall code for reading integer
  syscall       
  bltz $v0, Error_invalid_id #if $v0 is negative if error       
  move $t1, $v0  

  # check if id is valid ( 7 digits)
  bltu $t1,1000000, Error_id_in_delete
  bgtu $t1,9999999, Error_id_in_delete
   # call the search function 
   move $a0,$t1		# load id 
   li $a1,1		# load search mode 
   ##########################
 # before jumping , save the return address ($ra) onto the stack 
   subi $sp, $sp, 4    # adjust the stack pointer 
   sw $ra, ($sp)       # store the valu
   
   jal search_by_id  # this function fills the result_pointers array
                   
    # after returning  restore $ra from the stack
    lw $ra, ($sp)       # load the value of $ra from the stack
    addi $sp, $sp, 4    # Adjust the stack 
    
    ###########################
   # print all records in result if not empty 
   la $t4, result_pointers
   lw $t0,0($t4)  
   beqz $t0, not_found # No records if first one is null
   lw $t0,4($t4)
   beqz $t0, one_test_found
   
    #######################################
     print_string(choose_test_to_delete)
     # before jumping , save the return address ($ra) onto the stack
    subi $sp, $sp, 4    # adjust the stack pointer 
    sw $ra, ($sp)    # store the value
   
    jal  print_result  # this function fills the result_pointers array
    
    	# after returning  restore $ra from the stack
	lw $ra, ($sp)       # load the value of $ra from the stack
	addi $sp, $sp, 4    # Adjust the stack
    ##################################

    li $v0, 5 #systemcall to read integer
    syscall
    
    move $t0,$v0 # move the input integer to $t0
    la $t4,result_pointers
    addiu $t0,$t0,-1 
    sll $t0,$t0,2
    add $t4,$t4,$t0 # t4 <- result_pointer + index_of_patient
    lw $t1,0($t4) #$t1 Contains the address of test to delete
     j Continue_Delete
one_test_found: 
     print_string(one_found)
     lw $t1,0($t4)#$t1 Contains the address of test to delete
     li $v0, 4 
     move $a0, $t1
     syscall
  
     j Continue_Delete
     
Continue_Delete: #$t1 Contains the address of test to delete
     la $t0,pointers
findAddress:
     lw $t2,0($t0)
     beq $t2,$t1,addressFound
     addiu $t0, $t0, 4
     j findAddress
addressFound: # the index of the address is in $t0 
        move $t3,$t0 #move the index to $t3
        addiu $t3,$t3,4 #the next index in the pointer array 
shift:        
        lw $t4,0($t3) #load the next address
        sw $t4,0($t0) #shift the address 
        beqz $t4, endDelete
        addiu $t0,$t0,4
        addiu $t3,$t3,4
        j shift
not_found:
    print_string(no_tests_found) 
    jr $ra
endDelete:    
    lw $t0, numberOfTests
    subi $t0, $t0, 1
    sw $t0, numberOfTests
    print_string(test_deleted)
    jr $ra           


############## Get All upnormal tests Function ###############

all_unnormal_option:

# choose test number 
choose_test:
    print_string(newLine) 
    print_string(enter_test_name) 
    li $v0, 5 #syscall for read integer (1 for Hgb. 2 for BGT. 3 for LDL. 4 for BPT. 5 for RBC)
    syscall # the input number is in $v0 
    move $t1,$v0 # $t1 <- the input number 
    blt $t1,1,Error_invalid_option
    bgt $t1,5,Error_invalid_option 

#li $t1, 3

#Start loop on all records:

   la $t3, pointers # start looking for tests
   la $t4, result_pointers
   
loop_all:
  
    li $t0,0 # reset flag   
    lw $a0, 0($t3)  
    move $t6, $a0 #save address of test
    beqz $a0, end_option  # Branch if the pointer is null


	# extract test name
	
	# before jumping , save the return address ($ra)
	subi $sp, $sp, 12    # adjust the stack pointer 
	sw $ra, ($sp)       # store the value
	sw $t0, 4($sp)      
      	sw $t1, 8($sp)     
      	
    move $a0, $t6
    jal  extract_test_name  # fill the temp_test_name    

    	# after returning restore $ra from the stack
	lw $ra, ($sp)       # load the value of $ra from the stack
	lw $t0, 4($sp)      # load the value of $t2 from the stack
	lw $t1, 8($sp)      # load the value of $t2 from the stack
	addi $sp, $sp, 12    # Adjust the stack
	
	
	# now test is extracted
	
	#Get test number ( store in $t2)
			    		    	
	# before jumping , save the return address ($ra) & ($t3)  onto the stack
	subi $sp, $sp, 28   # adjust the stack pointer 
	sw $ra, ($sp)       # store the value
	sw $t0, 4($sp)     
        sw $t1, 8($sp)     
        sw $t2, 12($sp)     
        sw $t3, 16($sp)    
        sw $t4, 20($sp)
        sw $t5, 24($sp)          
        
    la $a0,temp_test_name
    jal  get_test_number    
   
    
    	# after returning restore $ra from the stack
	lw $ra, ($sp)       # load the value of $ra from the stack
	lw $t0, 4($sp)     
	lw $t1, 8($sp)     
	lw $t2, 12($sp)     
	lw $t3, 16($sp)     
	lw $t4, 20($sp)     
	lw $t5, 24($sp)      
	addi $sp, $sp, 28    # Adjust the stack

    
    
    move $t2,$v0 # test number of this record is saved in $t2

	#If number matches
	addi $t3, $t3, 4  # each pointer is 4 bytes 
	bne $t2, $t1 ,loop_all # if not the same test skip 
	
		#call: check_test_range
		
		#-------------------------
		# before jumping , save the return address ($ra) onto the stack
		subi $sp, $sp, 12   # adjust the stack pointer 
		sw $ra, ($sp)       # store the value
		sw $t2, 4 ($sp)  
		sw $t1, 8 ($sp)  

    			move $a0,$t6	
    			jal check_test_range    

    		# after returning restore $ra from the stack
		lw $ra, ($sp)       # load the value of $ra from the stack
		lw $t2, 4($sp) 
		lw $t1, 8($sp)         
		addi $sp, $sp, 12    # Adjust the stack 
  
  		 #xor $v0, $v0, 1 # for upnormal tests
   		 move $t0, $v0    # set flag if flag is not zero do not add
   		
		#--------------------
		#check flag 
			bnez $t0 ,loop_all
			#if flag=0
				#add test to result 
				#--------------------
				sw $t6, 0($t4) # store address of equal test in patient pointers
    				addi $t4, $t4, 4  # each pointer is 4 bytes 
				#--------------------
				
		#go to next record
		b loop_all
		
		
end_option:	
	
	#store null terminator
	sw $0, 0($t4) 	
	
	
	 # before jumping , save the return address ($ra) onto the stack
	subi $sp, $sp, 4    # adjust the stack pointer 
	sw $ra, ($sp)       # store the value


		jal  print_result  # this function fills the result_pointers array
    
    
    	# after returning  restore $ra from the stack
	lw $ra, ($sp)       # load the value of $ra from the stack
	addi $sp, $sp, 4    # Adjust the stack 
	
	

jr $ra


     
############## Update Option Function ###############

update_option:


  print_string (id_prompt)
  # read the id 
  li $v0, 5      # syscall code for reading integer
  syscall       
  bltz $v0, Error_invalid_id #if $v0 is negative if error       
  move $t1, $v0  

  # check if id is valid ( 7 digits)
  bltu $t1,1000000, Error_id_in_update
  bgtu $t1,9999999, Error_id_in_update
  
  
   # call the search function 
   move $a0,$t1		# load id 
   li $a1,1		# load search mode 



 	# before jumping , save the return address ($ra) onto the stack 
  	 subi $sp, $sp, 4    # adjust the stack pointer 
  	 sw $ra, ($sp)       # store the valu
   
  jal search_by_id  # this function fills the result_pointers array
                   
    	# after returning  restore $ra from the stack
    	lw $ra, ($sp)       # load the value of $ra from the stack
    	addi $sp, $sp, 4    # Adjust the stack 
    

   # print all records in result if not empty 
   la $t4, result_pointers
   lw $t0,0($t4)  
   beqz $t0, not_found_update # No records if first one is null
   lw $t0,4($t4)
   beqz $t0, one_test_found_update
   
   
     print_string(choose_test_to_update)
     
     
     	# before jumping , save the return address ($ra) onto the stack
   	subi $sp, $sp, 4    # adjust the stack pointer 
    	sw $ra, ($sp)    # store the value
   
    jal  print_result  # this function fills the result_pointers array
    
    	# after returning  restore $ra from the stack
	lw $ra, ($sp)       # load the value of $ra from the stack
	addi $sp, $sp, 4    # Adjust the stack
	


    li $v0, 5 #system call to read integer
    syscall
    
    move $t0,$v0 # move the input integer to $t0
    la $t4,result_pointers
    addiu $t0,$t0,-1 
    sll $t0,$t0,2
    add $t4,$t4,$t0 # t4 <- result_pointer + index_of_patient
    lw $t1,0($t4) #$t1 Contains the address of test to update
    
    j Continue_Update
     
     
one_test_found_update: 
     print_string(one_found)
     lw $t1,0($t4)#$t1 Contains the address of test to delete
     li $v0, 4 
     move $a0, $t1
     syscall
  
     j Continue_Update



 Continue_Update: #$t1 Contains the address of test to update
 
 	# fisrt we want to find the record to update
 	  la $t0,pointers
 	  
findAddressUpdate:
     lw $t2,0($t0)
     beq $t2,$t1,addressFoundUpdate
     addiu $t0, $t0, 4
     j findAddressUpdate
     
addressFoundUpdate: 

 	#$t1 has test address
 	#$t2 has test number
 	 	
 	 	
	#get test number :
	
	# extract test name
	# before jumping , save the return address ($ra)
	subi $sp, $sp, 8    # adjust the stack pointer 
	sw $ra, ($sp)       # store the value
	sw $t1, 4($sp) 
	    	
    move $a0, $t1
    jal  extract_test_name  # fill the temp_test_name    

    	# after returning restore $ra from the stack
	lw $ra, ($sp)       # load the value of $ra from the stack
	lw $t1, 4($sp)     
	addi $sp, $sp, 8    # Adjust the stack
	
	
	# now test is extracted
	
	#Get test number ( store in $t2)
			    		    	
	# before jumping , save the return address ($ra) & ($t3)  onto the stack
	subi $sp, $sp, 28   # adjust the stack pointer 
	sw $ra, ($sp)       # store the value
	sw $t0, 4($sp)     
        sw $t1, 8($sp)     
        sw $t2, 12($sp)     
        sw $t3, 16($sp)    
        sw $t4, 20($sp)
        sw $t5, 24($sp)          
        
    la $a0,temp_test_name
    jal  get_test_number    
   
    	# after returning restore $ra from the stack
	lw $ra, ($sp)       # load the value of $ra from the stack
	lw $t0, 4($sp)     
	lw $t1, 8($sp)     
	lw $t2, 12($sp)     
	lw $t3, 16($sp)     
	lw $t4, 20($sp)     
	lw $t5, 24($sp)      
	addi $sp, $sp, 28    # Adjust the stack

   
    	move $t2,$v0 # test number of this record is saved in $t2

	
 	# ask user to enter new float value and 2 results if BPT
 
 enter_update_result:
    
    	beq $t2, 4, update_BPT_result
    	print_string(enter_result)
    	li $v0,8 #System call for reading string (The result will be read as string then converted to float)
    	la $a0,temp_result
    	li $a1,10 #maximum number of charecters to read
    	syscall
    	la $a0,temp_result
    	
    		# before jumping , save the return address ($ra)
		subi $sp, $sp, 12    # adjust the stack pointer 
		sw $ra, ($sp)       # store the value
		sw $t1, 4($sp)    # store the value
		sw $t2, 8($sp)    # store the value
		
    	jal is_float
    	    	
    		# after returning restore $ra from the stack
		lw $ra, ($sp)       # load the value of $ra from the stack
		lw $t1, 4($sp)  
		lw $t2, 8($sp)        
		addi $sp, $sp, 12   # Adjust the stack
	
	
	
    	move $t0,$v0
    	beqz $t0, invalid_result_format_update
    	j goUpdate
    
    
    	invalid_result_format_update: 
   	print_string(invalid_result)
   	j  enter_update_result
   
   
update_BPT_result: 
    print_string(enter_result1)
    li $v0,8 #System call for reading string (The result will be read as string then converted to integer)
    la $a0,temp_result
    li $a1,10 #maximum number of charecters to read
    syscall
    la $a0,temp_result
    
    		# before jumping , save the return address ($ra)
		subi $sp, $sp, 12    # adjust the stack pointer 
		sw $ra, ($sp)       # store the value
		sw $t1, 4($sp)    # store the value
		sw $t2, 8($sp)    # store the value
		
    	jal is_float
    	    	
    		# after returning restore $ra from the stack
		lw $ra, ($sp)       # load the value of $ra from the stack
		lw $t1, 4($sp)  
		lw $t2, 8($sp)        
		addi $sp, $sp, 12   # Adjust the stack
	
	
    move $t0,$v0
    beqz $t0, invalid_result1_format_update
    j update_result2
    
invalid_result1_format_update: 
   print_string(invalid_result)
   j update_BPT_result
   
update_result2:
   print_string(enter_result2)
    li $v0,8 #System call for reading string (The result will be read as string then converted to integer)
    la $a0,temp_result2
    li $a1,10 #maximum number of charecters to read
    syscall
    la $a0,temp_result2
    
   		# before jumping , save the return address ($ra)
		subi $sp, $sp, 12    # adjust the stack pointer 
		sw $ra, ($sp)       # store the value
		sw $t1, 4($sp)    # store the value
		sw $t2, 8($sp)    # store the value
		
    	jal is_float
    	    	
    		# after returning restore $ra from the stack
		lw $ra, ($sp)       # load the value of $ra from the stack
		lw $t1, 4($sp)  
		lw $t2, 8($sp)        
		addi $sp, $sp, 12   # Adjust the stack
	
	
    move $t0,$v0
    beqz $t0, invalid_result2_format_update
    j goUpdate
    
invalid_result2_format_update: 
    print_string(invalid_result)
    j update_result2 
    
    
    goUpdate:
    	# $t1 has address of test
    	#$t2 has test number
    	
    	# we want to update value in the 23 byte
	addiu $t1,$t1,23
	
	
    	# rewrite to update and write null at last
      	
    	la $t4, temp_result
       	
   write:
  	lb $t3,0($t4) #load character
  	beq $t3,10, end_write
  	sb $t3,0($t1)
 	addiu $t1,$t1,1
  	addiu $t4,$t4,1
  	j write
  
  end_write:
  	bne $t2 ,4 , store_null

 	#store comma
 	li $t3, ','          # Load the ASCII value of comma into $t3
	sb $t3, 0($t1)

  	addiu $t1,$t1,1
	#store space after comma 
	li $t3, ' '          # Load the ASCII value of comma into $t3
	sb $t3, 0($t1)

  	addiu $t1,$t1,1
  	
    	la $t4, temp_result2
    	
  write_2:
  	lb $t3,0($t4) #load character
  	beq $t3,0, store_null
  	beq $t3,10, store_null
  	sb $t3,0($t1)
 	addiu $t1,$t1,1
  	addiu $t4,$t4,1
  	j write_2
  	
 
 store_null:
 	#store newline
 	li $t3, 10          
	sb $t3, 0($t1)
	addiu $t1,$t1,1
	
 	#load character
  	sb $0,0($t1)
 
 	#-----------------------------------------------------------------------------------------------------#
        b  endUpdate 
                            
not_found_update:
    print_string(no_tests_found) 
    jr $ra
endUpdate:    
    print_string(test_updated)
    jr $ra    
          

############## Get Average of Tests Function ###############

Average_Test_Value: 
   subi $sp, $sp, 4
   sw $ra, 0($sp)
   jal initialize_arrays #function to initialize counters array and sum array
   lw $ra , 0($sp)
   addi $sp, $sp, 4
   
   la $t0,pointers 
   lw $t9, numberOfTests
tests_loop:
   lw $t1,0($t0)
   #lw $t8,4($t0)
   beqz $t9, end_tests_loop
   ##############################
   # before jumping , save the return address ($ra) onto the stack 
   subi $sp, $sp, 12    # adjust the stack pointer 
   sw $ra, ($sp)      # store the valu
   sw $t0, 4($sp)
   sw $t1, 8($sp)
 
   move $a0,$t1
   jal extract_test_name 
                   
    # after returning  restore $ra from the stack
    lw $ra, ($sp) 
    lw $t0, 4($sp) 
    lw $t1, 8($sp) 
  
    addi $sp, $sp,12    # Adjust the stack 
    ##########################
    
   subi $sp, $sp, 12  # adjust the stack pointer 
   sw $ra, ($sp)   
   sw $t0, 4($sp)
   sw $t1, 8($sp)
 
    la $a0,temp_test_name
    jal  get_test_number 
    move $t7,$v0 
    
   move $a0, $t7
  # print the funtion number for testing
  # li $v0,1
  #syscall
  #print_string(newLine)
    lw $ra, ($sp)
    lw $t0, 4($sp)
    lw $t1, 8($sp)
      
    addi $sp, $sp, 12  # Adjust the stack

    beq $t7, 1, HGB_SUM
    beq $t7, 2, BGT_SUM
    beq $t7, 3, LDL_SUM
    beq $t7, 4, BPT_SUM
    beq $t7, 5, RBC_SUM
next_test:   
    addi $t0, $t0, 4 #move to next test
    subi $t9, $t9, 1
    j tests_loop
BGT_SUM:
   
    la $t2,Counters_array
    lw $t3,4($t2)
    addi $t3,$t3,1
    sw $t3,4($t2)
    addi $t1, $t1, 23 # add 23 byte to the test address
    move $a0,$t1
    subi $sp, $sp, 8  # adjust the stack pointer 
    sw $ra, ($sp)  
    sw $t0, 4($sp) 
   
    jal str2float
   
    lw $ra, ($sp)
    lw $t0, 4($sp) 
    addi $sp, $sp, 8  
    la $t2,Sum_array
    lwc1 $f1,4($t2)
    add.s $f1,$f1,$f0
    swc1 $f1,4($t2)
    j next_test
 #################3   
HGB_SUM:
    la $t2,Counters_array
    lw $t3,0($t2)
    addi $t3,$t3,1
    sw $t3,0($t2)
    addi $t1, $t1, 23 # add 23 byte to the test address
    move $a0,$t1
    subi $sp, $sp, 8  # adjust the stack pointer 
    sw $ra, ($sp)  
    sw $t0, 4($sp) 
   
    jal str2float
    lw $ra, ($sp)
    lw $t0, 4($sp) 
    addi $sp, $sp, 8  
    la $t2,Sum_array
    lwc1 $f1,0($t2)
    add.s $f1,$f1,$f0
    swc1 $f1,0($t2)
    j next_test
################################### 
LDL_SUM:
   la $t2,Counters_array
    lw $t3,8($t2)
    addi $t3,$t3,1
    sw $t3,8($t2)
    addi $t1, $t1, 23 # add 23 byte to the test address
    move $a0,$t1
    subi $sp, $sp, 8  # adjust the stack pointer 
    sw $ra, ($sp)  
    sw $t0, 4($sp) 
   
    jal str2float
    
    #mov.s $f12, $f0
    #li $v0,2
    #syscall
    
    lw $ra, ($sp)
    lw $t0, 4($sp) 
    addi $sp, $sp, 8  
    la $t2,Sum_array
    lwc1 $f1,8($t2)
    add.s $f1,$f1,$f0
    swc1 $f1,8($t2)

    j next_test
##################################3  
BPT_SUM:
    la $t2,Counters_array
    lw $t3,12($t2)
    addi $t3,$t3,1
    sw $t3,12($t2)
    sw $t3,16($t2)
    
    addi $t1, $t1, 23 # add 23 byte to the test address
    move $a0,$t1
    subi $sp, $sp,12  # adjust the stack pointer 
    sw $ra, ($sp)  
    sw $t0, 4($sp) 
    sw $t1, 8($sp)
    jal str2float
    
    lw $ra, ($sp)
    lw $t0, 4($sp) 
    lw $t1, 8($sp)
    addi $sp, $sp, 12
    la $t2,Sum_array
    lwc1 $f1,12($t2)
    add.s $f1,$f1,$f0
    swc1 $f1,12($t2)
 
   find_comma2:
	lb $t7, 0($t1)
	addiu $t1, $t1,1
	bne  $t7,',',find_comma2
     
        addiu $t1, $t1,1  

    move $a0,$t1
  
    subi $sp, $sp, 8  # adjust the stack pointer 
    sw $ra, 0($sp)  
    sw $t0, 4($sp) 
   
    jal str2float
    lw $ra, 0($sp)
    lw $t0, 4($sp) 
    addi $sp, $sp, 8  
    la $t2,Sum_array
    lwc1 $f1,16($t2)
    add.s $f1,$f1,$f0
    swc1 $f1,16($t2)
      mov.s $f12,$f0
    
    j next_test
     ##########################
RBC_SUM:
 la $t2,Counters_array
    lw $t3,20($t2)
    addi $t3,$t3,1
    sw $t3,20($t2)
    addi $t1, $t1, 23 # add 23 byte to the test address
    move $a0,$t1
    subi $sp, $sp, 8  # adjust the stack pointer 
    sw $ra, ($sp)  
    sw $t0, 4($sp) 
   
    jal str2float
    lw $ra, ($sp)
    lw $t0, 4($sp) 
    addi $sp, $sp, 8  
    la $t2,Sum_array
    lwc1 $f1,20($t2)
    add.s $f1,$f1,$f0
    swc1 $f1,20($t2)
    j next_test  
   ################################# 
   
end_tests_loop:

 ###########################
   la $t0,Counters_array
   la $t1,Sum_array
   li $t3,0 # Counter 
   
Calculate_Avg: 
    beq $t3,6 end_avg
    lw $t2,0($t0) #load the count number of a specifed test
    beqz $t2, noTests
    lwc1 $f12,0($t1) # load the sum of results of a specified test
    mtc1 $t2,$f0 
    cvt.s.w $f0,$f0 
    div.s $f12,$f12,$f0
    j print_avg_value
Cont: 

    addi $t0,$t0,4 # move to  the next index of counters array
    addi $t1,$t1,4 # move to the index of sum array
    addi $t3,$t3,1 # increment the loop index
    j Calculate_Avg
    
 # To print result when there in no tests of a specified type   
noTests: 
 beq $t3,0,No_HGB_tests
 beq $t3,1,No_BGT_tests
 beq $t3,2,No_LDL_tests
 beq $t3,3,No_BPT_tests
 beq $t3,4,No_BPT_tests1
 beq $t3,5,No_RBC_tests

No_HGB_tests:
 print_string(noHgbTests)
 j Cont 
No_BGT_tests:
 print_string(noBgtTests)
 j Cont 
No_LDL_tests:
 print_string(noLdlTests)
 j Cont 
 No_BPT_tests:
 print_string(noBptTests)
 j Cont 
 No_BPT_tests1:
 #print_string(noBgtTests1)
 j Cont 
 No_RBC_tests:
 print_string(noRbcTests)
 j Cont 
 
print_avg_value:
 beq $t3,0,HGB_Avg
 beq $t3,1,BGT_Avg
 beq $t3,2,LDL_Avg
 beq $t3,3,BPT_Avg1
 beq $t3,4,BPT_Avg2
 beq $t3,5,RBC_Avg
HGB_Avg: 
  print_string(HGB_avg)
  li $v0, 2 # print float 
  syscall
  j Cont # go back to continue the loop
BGT_Avg: 
  print_string(BGT_avg)
  li $v0, 2 # print float 
  syscall
  j Cont # go back to continue the loop
LDL_Avg: 
  print_string(LDL_avg)
  li $v0, 2 # print float 
  syscall
  j Cont # go back to continue the loop
  BPT_Avg1: 
  print_string(BPT_avg1)
  li $v0, 2 # print float 
  syscall
  j Cont # go back to continue the loop
 BPT_Avg2: 
  print_string(BPT_avg2)
  li $v0, 2 # print float 
  syscall
  j Cont # go back to continue the loop
  RBC_Avg: 
  print_string(RBC_avg)
  li $v0, 2 # print float 
  syscall
  j Cont # go back to continue the loop
end_avg:   
   
 jr $ra
 
############## Intialize Arrays Function ###############

# intialize arrays used is average
initialize_arrays: 

 la $t0, Sum_array
 la $t1, Counters_array
 li $t2, 0 # the index of array 
loop_arrays: 

   sw $0,0($t0)
   sw $0,0($t1)
   addi $t0,$t0,4 # next element in sum array
   addi $t1,$t1,4 # next element in counters array
   addi $t2,$t2,1
   beq $t2,6, end_loop
   j loop_arrays
end_loop:
  jr $ra   
  
  
############## Print Output Function ###############

print_output_file_content:
  subi $sp, $sp, 4
  sw $ra, 0($sp)
  
  jal Save #save data to output file
  
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  
   la $t0, pointers
print:  
   lw $t1, 0($t0)
   beqz $t1 end_print
   move $a0, $t1 # address on null terminated string
   li $v0,4 # print string
   syscall 
   addi $t0,$t0,4
   j print 
end_print: 
 jr $ra 
 
#########################################################



#------------------------------------------------------------- Error Handiling ---------------------------------------------------------------# 

#########################################################
Error_invalid_id: 
  print_string(error_invalid_id) #print an error message to user 
  j enter_id #prompt the user to enter id again
  
#########################################################

Error_invalid_min_month: 
  print_string(error_invalid_month) #print an error message to user 
  j min_month #prompt the user to enter id again
  
#########################################################

Error_invalid_max_month: 
  print_string(error_invalid_month) #print an error message to user 
  j max_month #prompt the user to enter id again
  
#########################################################

Error_id_in_delete:
   print_string(error_invalid_id) #print an error message to user 
  j DeleteTest #prompt the user to start delete option again
 
#########################################################

Error_id_in_update:
   print_string(error_invalid_id) #print an error message to user 
  j update_option #prompt the user to start update option again

#########################################################

Error_opening_file: 
  print_string(error_open_file) #print an error message to user 
  j end #end the program 
  
#########################################################

Error_reading_file: 
  print_string(error_read_file) #print an error message to user 
  j end #end the program 
  
#########################################################
  
Error_invalid_option: 
     print_string(error_option_num)
     j choose_test
     
#########################################################


 #------------------------------------------------------------- Program End  --------------------------------------------------------------# 
