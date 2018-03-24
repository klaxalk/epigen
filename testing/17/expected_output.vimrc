" This test aims to test absolute file paths

" This line should stay commented

This line should stay uncommented

This line should become uncommented " EPIGEN_LINE_TEST ACTIVE

This line should stay uncommented " EPIGEN_LINE_TEST ACTIVE

" EPIGEN_BLOCK_TEST ACTIVE {

This block should become uncommented
....

This bracket } should not brake it

" EPIGEN_BLOCK_TEST }

" EPIGEN_BLOCK_TEST ACTIVE {

This line should become uncomemmented

" EPIGEN_BLOCK_TEST2 ACTIVE {

This block should become uncommented
....

This bracket } should not brake it

this lineshould become completely uncommented " EPIGEN_LINE_TEST3 ACTIVE

" EPIGEN_BLOCK_TEST2 }

" EPIGEN_BLOCK_TEST }

" EPIGEN_BLOCK_TEST ACTIVE {
this is a short block which will be uncomemmented
" EPIGEN_BLOCK_TEST }

" EPIGEN_BLOCK_TEST2 ACTIVE {
this line should become completely uncommented " EPIGEN_LINE_TEST ACTIVE
" EPIGEN_BLOCK_TEST2 }
