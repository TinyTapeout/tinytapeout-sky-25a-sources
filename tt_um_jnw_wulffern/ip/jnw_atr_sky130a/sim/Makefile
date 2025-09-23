
all:
	${foreach c, ${CELLS}, ${MAKE} run NAME=${c};}


include ../tech/make/sim.make

include ../cic/cells

LIB=JNW_ATR_SKY130NM
CELL=NCH_2C1F2
PREFIX=JNWATR_

TCELL=PCH_4C1F2

test:
	${MAKE} run CORNER="typical" NAME=${TCELL}
	#test -f ${PREFIX}${TCELL}/output_dc/dc_SchGtKttTtVt.yaml || exit;
	#cat ${PREFIX}${TCELL}/output_dc/dc_SchGtKttTtVt.yaml |grep gmid10_vgs|perl -ne '($$k,$$v) = split(/ /);if($$v < -1){exit 0;}{exit 1;}'

posts:
	${foreach c, ${CELLS}, ${MAKE} post CELL=${c};}

post:
	echo "---\nlayout: page\ntitle: ${PREFIX}${CELL}\n---\n\n" > ../docs/_mos/${PREFIX}${CELL}.md;
	cat ${PREFIX}${CELL}/README.md >> ../docs/_mos/${PREFIX}${CELL}.md;

run:
	test -d ${PREFIX}${NAME} && cd ${PREFIX}${NAME} && make ${CORNER} OPT=${OPT}

gen:
	python3 gendirs.py

parse:
	python3 parse.py

summary:
	python3 plot.py
	cat header.md README.md > ../docs/_mos/all.md
