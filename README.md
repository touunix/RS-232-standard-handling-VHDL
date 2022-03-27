# ENG RS-232 standard handling VHDL
###### Description


###### Simulation results
<img src="https://user-images.githubusercontent.com/79804729/160301829-92dcaccc-3626-402d-9348-b7caa67f773a.png" width="100%"></img> 

###### Verification results
<img src="https://user-images.githubusercontent.com/79804729/160301973-e302d424-bf75-46af-ae9b-0c6e80b5cc37.gif" width="100%"></img> 

###### Files description
- top_bit.vhd - VHDL file with the operation algorithm
- top_rs232.vhd - VHDL file with data receiver in the RS-232 standard and implementation of the adder
- tb.vhd - testbench file
- iup9.xdc - file with constraints for the Nexys-A7 board (FPGA xc7a100tcsg324-1)

# PL Obsługa portu RS-232 LED VHDL
###### Opis
Układ po zaprogramowaniu, pełni funkcję nadajnika oraz odbiornika danych w standardzie RS-232. Układ posiada następujące parametry transmisji: bit startu, 8 bitów danych, bit stopu, szybkość transmisji 9600 bps. Odbiornik RS-232 po otrzymaniu danych podaje je do sumatora i dodaje do nich wartości 20h, po czym nadajnik wysyła je.
Nadawanie oraz odbiór sygnałów w standardzie RS232 odbywa się w sposób szeregowy, oddzielnie na dwóch liniach w kierunkach do i od urządzenia. Gdy nie ma transmisji, sygnał na danej linii jest w stanie wysokim. Rozpoczęcie transmisji sygnalizowane jest poprzez bit startu, który jest stanem niskim („0”). Następnie nadawane są szeregowo dane począwszy od LSB do MSB. Zakończenie transmisji sygnalizowane jest bitem stopu, który jest stanem wysokim („1”).
Dane w standardzie RS-232 zostały wysłane za pomocą programu Putty, gdzie zostało wybrane połączenie Serial, z prędkością 9600 oraz portem COM7. Zostało włączone echo lokalne, aby umożliwić weryfikację prawidłowości odbioru, przetwarzania i wysyłania znaków.

Przykładowo:
<img src="https://user-images.githubusercontent.com/79804729/160301791-a3824f87-8b54-4afe-8380-e81b66f5dc9c.jpg" width="100%"></img> 

###### Wyniki symulacji
<img src="https://user-images.githubusercontent.com/79804729/160301829-92dcaccc-3626-402d-9348-b7caa67f773a.png" width="100%"></img> 

###### Wyniki weryfikacji
<img src="https://user-images.githubusercontent.com/79804729/160301973-e302d424-bf75-46af-ae9b-0c6e80b5cc37.gif" width="100%"></img> 

###### Opis plików
- top_bit.vhd - plik VHDL z algorytmem działania
- top_rs232.vhd - plik VHDL z odbiornikiem danych w standardzie RS-232 oraz realizacja sumatora
- tb.vhd - plik testbench
- iup9.xdc - plik z ograniczeniami projektowymi dla płytki Nexys-A7 (układ FPGA xc7a100tcsg324-1)
