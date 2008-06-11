# $Id: setshow.cmd 346 2007-11-14 01:39:05Z rockyb $
# This tests the functioning of some set/show debugger commands
set debuggertesting on
### *******************************
### ***   Set/show commands     ***
### *******************************
########################################
###   test args and baseneme...
########################################
set args this is a test
show args
show basename
set basename foo
show base
set basename off
show basename
set basename 0
show basename
set basename 1
show basename
########################################
###   test listsize tests...
########################################
show listsize
show listsi
set listsize abc
set listsize -20
########################################
###  test linetrace...
########################################
set linetrace on
show linetrace
set linetrace off
show linetrace
########################################
###  show history
########################################
set history
set history size 10
show history size
set history save off
show history save
set history save 1
show history save
