" This test aims to test relative file paths

" This line should stay commented

This line should stay uncommented

" This line should become uncommented " EPIGEN_LINE_TEST

This line should stay uncommented " EPIGEN_LINE_TEST ACTIVE

" EPIGEN_BLOCK_TEST {

" This block should become uncommented
" ....

" This bracket } should not brake it

" EPIGEN_BLOCK_TEST }

" EPIGEN_BLOCK_TEST {

" This line should become uncomemmented

" " EPIGEN_BLOCK_TEST2 {

" " This block should become uncommented
" " ....

" " This bracket } should not brake it

" " " this lineshould become completely uncommented " EPIGEN_LINE_TEST3

" " EPIGEN_BLOCK_TEST2 }

" EPIGEN_BLOCK_TEST }

" EPIGEN_BLOCK_TEST {
" this is a short block which will be uncomemmented
" EPIGEN_BLOCK_TEST }

" EPIGEN_BLOCK_TEST2 {
" " this line should become completely uncommented " EPIGEN_LINE_TEST
" EPIGEN_BLOCK_TEST2 }
