" This test is designed to test activation of nested lines and blocks

" This line should stay commented

This line should stay uncommented

" This line should become uncommented " EPIGEN_ADD_LINE_TEST

This line should stay uncommented " EPIGEN_ADD_LINE_TEST ACTIVE

" EPIGEN_ADD_BLOCK_TEST {

" This block should become uncommented
" ....

" This bracket } should not brake it

" EPIGEN_ADD_BLOCK_TEST }

" EPIGEN_ADD_BLOCK_TEST {

" This line should become uncomemmented

" " EPIGEN_ADD_BLOCK_TEST2 {

" " This block should become uncommented
" " ....

" " This bracket } should not brake it

" " " this lineshould become completely uncommented " EPIGEN_ADD_LINE_TEST3

" " EPIGEN_ADD_BLOCK_TEST2 }

" EPIGEN_ADD_BLOCK_TEST }

" EPIGEN_ADD_BLOCK_TEST {
" this is a short block which will be uncomemmented
" EPIGEN_ADD_BLOCK_TEST }

" EPIGEN_ADD_BLOCK_TEST2 {
" " this line should become completely uncommented " EPIGEN_ADD_LINE_TEST
" EPIGEN_ADD_BLOCK_TEST2 }
