#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/max32.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/max32.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

ifdef SUB_IMAGE_ADDRESS

else
SUB_IMAGE_ADDRESS_COMMAND=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=..\src\config\default\peripheral\i2c\master\plib_i2c1_master.c ..\src\config\default\peripheral\uart\plib_uart4.c ..\src\main.c ..\src\config\default\initialization.c ..\src\config\default\interrupts.c ..\src\config\default\exceptions.c ..\src\config\default\stdio\xc32_monitor.c ..\src\config\default\peripheral\clk\plib_clk.c ..\src\config\default\peripheral\gpio\plib_gpio.c ..\src\config\default\peripheral\evic\plib_evic.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/2016788125/plib_i2c1_master.o ${OBJECTDIR}/_ext/631034509/plib_uart4.o ${OBJECTDIR}/_ext/1362277832/main.o ${OBJECTDIR}/_ext/2062370875/initialization.o ${OBJECTDIR}/_ext/2062370875/interrupts.o ${OBJECTDIR}/_ext/2062370875/exceptions.o ${OBJECTDIR}/_ext/1785698216/xc32_monitor.o ${OBJECTDIR}/_ext/1226587005/plib_clk.o ${OBJECTDIR}/_ext/630631566/plib_gpio.o ${OBJECTDIR}/_ext/630577738/plib_evic.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/2016788125/plib_i2c1_master.o.d ${OBJECTDIR}/_ext/631034509/plib_uart4.o.d ${OBJECTDIR}/_ext/1362277832/main.o.d ${OBJECTDIR}/_ext/2062370875/initialization.o.d ${OBJECTDIR}/_ext/2062370875/interrupts.o.d ${OBJECTDIR}/_ext/2062370875/exceptions.o.d ${OBJECTDIR}/_ext/1785698216/xc32_monitor.o.d ${OBJECTDIR}/_ext/1226587005/plib_clk.o.d ${OBJECTDIR}/_ext/630631566/plib_gpio.o.d ${OBJECTDIR}/_ext/630577738/plib_evic.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/2016788125/plib_i2c1_master.o ${OBJECTDIR}/_ext/631034509/plib_uart4.o ${OBJECTDIR}/_ext/1362277832/main.o ${OBJECTDIR}/_ext/2062370875/initialization.o ${OBJECTDIR}/_ext/2062370875/interrupts.o ${OBJECTDIR}/_ext/2062370875/exceptions.o ${OBJECTDIR}/_ext/1785698216/xc32_monitor.o ${OBJECTDIR}/_ext/1226587005/plib_clk.o ${OBJECTDIR}/_ext/630631566/plib_gpio.o ${OBJECTDIR}/_ext/630577738/plib_evic.o

# Source Files
SOURCEFILES=..\src\config\default\peripheral\i2c\master\plib_i2c1_master.c ..\src\config\default\peripheral\uart\plib_uart4.c ..\src\main.c ..\src\config\default\initialization.c ..\src\config\default\interrupts.c ..\src\config\default\exceptions.c ..\src\config\default\stdio\xc32_monitor.c ..\src\config\default\peripheral\clk\plib_clk.c ..\src\config\default\peripheral\gpio\plib_gpio.c ..\src\config\default\peripheral\evic\plib_evic.c



CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/max32.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=32MX795F512L
MP_LINKER_FILE_OPTION=,--script="..\\src\\config\\default\\p32MX795F512L.ld"
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/2016788125/plib_i2c1_master.o: ..\src\config\default\peripheral\i2c\master\plib_i2c1_master.c  .generated_files/7ef915b4807b36af0b7c301718d3b8fd097b1f46.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/2016788125" 
	@${RM} ${OBJECTDIR}/_ext/2016788125/plib_i2c1_master.o.d 
	@${RM} ${OBJECTDIR}/_ext/2016788125/plib_i2c1_master.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/default" -I"../src/packs/PIC32MX795F512L_DFP" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/2016788125/plib_i2c1_master.o.d" -o ${OBJECTDIR}/_ext/2016788125/plib_i2c1_master.o ..\src\config\default\peripheral\i2c\master\plib_i2c1_master.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/631034509/plib_uart4.o: ..\src\config\default\peripheral\uart\plib_uart4.c  .generated_files/d4b9cfd0bd4968fdb8d94671f8a5c28ec8dabd38.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/631034509" 
	@${RM} ${OBJECTDIR}/_ext/631034509/plib_uart4.o.d 
	@${RM} ${OBJECTDIR}/_ext/631034509/plib_uart4.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/default" -I"../src/packs/PIC32MX795F512L_DFP" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/631034509/plib_uart4.o.d" -o ${OBJECTDIR}/_ext/631034509/plib_uart4.o ..\src\config\default\peripheral\uart\plib_uart4.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1362277832/main.o: ..\src\main.c  .generated_files/54ebabcbee60fd9e9c705b324ed5465fe239ebd8.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1362277832" 
	@${RM} ${OBJECTDIR}/_ext/1362277832/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1362277832/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/default" -I"../src/packs/PIC32MX795F512L_DFP" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1362277832/main.o.d" -o ${OBJECTDIR}/_ext/1362277832/main.o ..\src\main.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2062370875/initialization.o: ..\src\config\default\initialization.c  .generated_files/7a0d0b92d2033e4a33f2518b5ad0b90f4a41f916.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/2062370875" 
	@${RM} ${OBJECTDIR}/_ext/2062370875/initialization.o.d 
	@${RM} ${OBJECTDIR}/_ext/2062370875/initialization.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/default" -I"../src/packs/PIC32MX795F512L_DFP" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/2062370875/initialization.o.d" -o ${OBJECTDIR}/_ext/2062370875/initialization.o ..\src\config\default\initialization.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2062370875/interrupts.o: ..\src\config\default\interrupts.c  .generated_files/11bb00f9a9735ff4159bbf9be126d81f9df44149.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/2062370875" 
	@${RM} ${OBJECTDIR}/_ext/2062370875/interrupts.o.d 
	@${RM} ${OBJECTDIR}/_ext/2062370875/interrupts.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/default" -I"../src/packs/PIC32MX795F512L_DFP" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/2062370875/interrupts.o.d" -o ${OBJECTDIR}/_ext/2062370875/interrupts.o ..\src\config\default\interrupts.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2062370875/exceptions.o: ..\src\config\default\exceptions.c  .generated_files/d8c72acaa564853faa3acc8c6f59ae003765909b.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/2062370875" 
	@${RM} ${OBJECTDIR}/_ext/2062370875/exceptions.o.d 
	@${RM} ${OBJECTDIR}/_ext/2062370875/exceptions.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/default" -I"../src/packs/PIC32MX795F512L_DFP" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/2062370875/exceptions.o.d" -o ${OBJECTDIR}/_ext/2062370875/exceptions.o ..\src\config\default\exceptions.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1785698216/xc32_monitor.o: ..\src\config\default\stdio\xc32_monitor.c  .generated_files/5c2113707fec1aab0e6039e87f6f748ea9b43457.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1785698216" 
	@${RM} ${OBJECTDIR}/_ext/1785698216/xc32_monitor.o.d 
	@${RM} ${OBJECTDIR}/_ext/1785698216/xc32_monitor.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/default" -I"../src/packs/PIC32MX795F512L_DFP" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1785698216/xc32_monitor.o.d" -o ${OBJECTDIR}/_ext/1785698216/xc32_monitor.o ..\src\config\default\stdio\xc32_monitor.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1226587005/plib_clk.o: ..\src\config\default\peripheral\clk\plib_clk.c  .generated_files/7f6ec2ab16cdf12c820e4909612d992d857dbf8f.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1226587005" 
	@${RM} ${OBJECTDIR}/_ext/1226587005/plib_clk.o.d 
	@${RM} ${OBJECTDIR}/_ext/1226587005/plib_clk.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/default" -I"../src/packs/PIC32MX795F512L_DFP" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1226587005/plib_clk.o.d" -o ${OBJECTDIR}/_ext/1226587005/plib_clk.o ..\src\config\default\peripheral\clk\plib_clk.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/630631566/plib_gpio.o: ..\src\config\default\peripheral\gpio\plib_gpio.c  .generated_files/61bf2ff8c979a386cd191ea67a555e6c3cbe0be0.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/630631566" 
	@${RM} ${OBJECTDIR}/_ext/630631566/plib_gpio.o.d 
	@${RM} ${OBJECTDIR}/_ext/630631566/plib_gpio.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/default" -I"../src/packs/PIC32MX795F512L_DFP" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/630631566/plib_gpio.o.d" -o ${OBJECTDIR}/_ext/630631566/plib_gpio.o ..\src\config\default\peripheral\gpio\plib_gpio.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/630577738/plib_evic.o: ..\src\config\default\peripheral\evic\plib_evic.c  .generated_files/6b2aa5cb369c53bb0f1ca164ce9d985153f2ff9.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/630577738" 
	@${RM} ${OBJECTDIR}/_ext/630577738/plib_evic.o.d 
	@${RM} ${OBJECTDIR}/_ext/630577738/plib_evic.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/default" -I"../src/packs/PIC32MX795F512L_DFP" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/630577738/plib_evic.o.d" -o ${OBJECTDIR}/_ext/630577738/plib_evic.o ..\src\config\default\peripheral\evic\plib_evic.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
else
${OBJECTDIR}/_ext/2016788125/plib_i2c1_master.o: ..\src\config\default\peripheral\i2c\master\plib_i2c1_master.c  .generated_files/bc083e741d2df1f40d0c4c61943df56328a2e997.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/2016788125" 
	@${RM} ${OBJECTDIR}/_ext/2016788125/plib_i2c1_master.o.d 
	@${RM} ${OBJECTDIR}/_ext/2016788125/plib_i2c1_master.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/default" -I"../src/packs/PIC32MX795F512L_DFP" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/2016788125/plib_i2c1_master.o.d" -o ${OBJECTDIR}/_ext/2016788125/plib_i2c1_master.o ..\src\config\default\peripheral\i2c\master\plib_i2c1_master.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/631034509/plib_uart4.o: ..\src\config\default\peripheral\uart\plib_uart4.c  .generated_files/99e294c5fdae9a58a7cd28b96ff38ed11826acab.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/631034509" 
	@${RM} ${OBJECTDIR}/_ext/631034509/plib_uart4.o.d 
	@${RM} ${OBJECTDIR}/_ext/631034509/plib_uart4.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/default" -I"../src/packs/PIC32MX795F512L_DFP" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/631034509/plib_uart4.o.d" -o ${OBJECTDIR}/_ext/631034509/plib_uart4.o ..\src\config\default\peripheral\uart\plib_uart4.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1362277832/main.o: ..\src\main.c  .generated_files/7f4a372df9c2fb8c892b76eff919af7d76863e0e.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1362277832" 
	@${RM} ${OBJECTDIR}/_ext/1362277832/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1362277832/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/default" -I"../src/packs/PIC32MX795F512L_DFP" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1362277832/main.o.d" -o ${OBJECTDIR}/_ext/1362277832/main.o ..\src\main.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2062370875/initialization.o: ..\src\config\default\initialization.c  .generated_files/6a90152045d83453ca41ab64b1d635423c529ceb.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/2062370875" 
	@${RM} ${OBJECTDIR}/_ext/2062370875/initialization.o.d 
	@${RM} ${OBJECTDIR}/_ext/2062370875/initialization.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/default" -I"../src/packs/PIC32MX795F512L_DFP" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/2062370875/initialization.o.d" -o ${OBJECTDIR}/_ext/2062370875/initialization.o ..\src\config\default\initialization.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2062370875/interrupts.o: ..\src\config\default\interrupts.c  .generated_files/99f194dc5681da68642e6eb509adb5f3cd99de0d.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/2062370875" 
	@${RM} ${OBJECTDIR}/_ext/2062370875/interrupts.o.d 
	@${RM} ${OBJECTDIR}/_ext/2062370875/interrupts.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/default" -I"../src/packs/PIC32MX795F512L_DFP" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/2062370875/interrupts.o.d" -o ${OBJECTDIR}/_ext/2062370875/interrupts.o ..\src\config\default\interrupts.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2062370875/exceptions.o: ..\src\config\default\exceptions.c  .generated_files/f1e7cd495187d6cc92acf79c089af1f832398439.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/2062370875" 
	@${RM} ${OBJECTDIR}/_ext/2062370875/exceptions.o.d 
	@${RM} ${OBJECTDIR}/_ext/2062370875/exceptions.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/default" -I"../src/packs/PIC32MX795F512L_DFP" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/2062370875/exceptions.o.d" -o ${OBJECTDIR}/_ext/2062370875/exceptions.o ..\src\config\default\exceptions.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1785698216/xc32_monitor.o: ..\src\config\default\stdio\xc32_monitor.c  .generated_files/e8aab37cdb3aa3360c652908d15abe24445678ca.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1785698216" 
	@${RM} ${OBJECTDIR}/_ext/1785698216/xc32_monitor.o.d 
	@${RM} ${OBJECTDIR}/_ext/1785698216/xc32_monitor.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/default" -I"../src/packs/PIC32MX795F512L_DFP" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1785698216/xc32_monitor.o.d" -o ${OBJECTDIR}/_ext/1785698216/xc32_monitor.o ..\src\config\default\stdio\xc32_monitor.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1226587005/plib_clk.o: ..\src\config\default\peripheral\clk\plib_clk.c  .generated_files/d396cbd6ef90b8c4fb48f02653fe12855f3fd52a.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1226587005" 
	@${RM} ${OBJECTDIR}/_ext/1226587005/plib_clk.o.d 
	@${RM} ${OBJECTDIR}/_ext/1226587005/plib_clk.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/default" -I"../src/packs/PIC32MX795F512L_DFP" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1226587005/plib_clk.o.d" -o ${OBJECTDIR}/_ext/1226587005/plib_clk.o ..\src\config\default\peripheral\clk\plib_clk.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/630631566/plib_gpio.o: ..\src\config\default\peripheral\gpio\plib_gpio.c  .generated_files/253dff44138ec07eff59fc3e520db88d77a2d931.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/630631566" 
	@${RM} ${OBJECTDIR}/_ext/630631566/plib_gpio.o.d 
	@${RM} ${OBJECTDIR}/_ext/630631566/plib_gpio.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/default" -I"../src/packs/PIC32MX795F512L_DFP" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/630631566/plib_gpio.o.d" -o ${OBJECTDIR}/_ext/630631566/plib_gpio.o ..\src\config\default\peripheral\gpio\plib_gpio.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/630577738/plib_evic.o: ..\src\config\default\peripheral\evic\plib_evic.c  .generated_files/6e6e26eca8b7f92b7e2a2417bcf0b22b7339d96f.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/630577738" 
	@${RM} ${OBJECTDIR}/_ext/630577738/plib_evic.o.d 
	@${RM} ${OBJECTDIR}/_ext/630577738/plib_evic.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/default" -I"../src/packs/PIC32MX795F512L_DFP" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/630577738/plib_evic.o.d" -o ${OBJECTDIR}/_ext/630577738/plib_evic.o ..\src\config\default\peripheral\evic\plib_evic.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/max32.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    ..\\src\\config\\default\\p32MX795F512L.ld
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -g -mdebugger -D__MPLAB_DEBUGGER_PK3=1 -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/max32.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)   -mreserve=data@0x0:0x1FC -mreserve=boot@0x1FC02000:0x1FC02FEF -mreserve=boot@0x1FC02000:0x1FC024FF  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D=__DEBUG_D,--defsym=__MPLAB_DEBUGGER_PK3=1,--defsym=_min_heap_size=512,--gc-sections,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml -mdfp="${DFP_DIR}"
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/max32.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   ..\\src\\config\\default\\p32MX795F512L.ld
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/max32.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=_min_heap_size=512,--gc-sections,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml -mdfp="${DFP_DIR}"
	${MP_CC_DIR}\\xc32-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/max32.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/default
	${RM} -r dist/default

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
