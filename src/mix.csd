<CsoundSynthesizer>
<CsOptions>
</CsOptions>
<CsInstruments>
sr= 44100
ksmps = 64
nchnls = 2
0dbfs  = 1

gacmb	init 0
garvb	init 0

		instr 106	
		ispd= p5
		ipan= p6
		ipch=  261.6256
a1		loscil 0.5, ipch*ispd, p4, ipch, 0
		outs     a1*ipan, a1*(1-ipan)
		endin

		instr	198
idur	=		p3
itime 	= 		p4
iloop 	= 		p5
kenv	linen	1, .01, idur, .01
acomb 	comb	gacmb, itime, iloop, 0
		out		acomb*kenv
gacmb	=		0
		endin

		instr 	199
idur	=		p3					
irvbtim	=		p4
ihiatn	=		p5
arvb	reverb2	garvb, irvbtim, ihiatn
		out		arvb
garvb	=		0
		endin

</CsInstruments>
<CsScore>
f 1 0 0 1 "/home/joel/audio/test.wav" 0 4 1

f 4 0 0 1 "/home/joel/audio/smile.wav" 0 4 1
f 5 0 0 1 "/home/joel/audio/smile.wav" 0 4 2



t 0 80

;ins	strt	dur 	rvbtim	hfroll	
;===================================================================
i199	0		34		2.6		.1		

;ins	strt	dur 	time	loop	
;===================================================================
i198	0		34		10		.25		

i 106 0  32 1 1 0 

i 106 0  12 4 1 0 
i 106 0  12 5 1 1
i 106 12 12 4 1 0
i 106 12 12 5 1 1
i 106 24 12 4 1 0
i 106 24 12 5 1 1
e

</CsScore>
</CsoundSynthesizer>
