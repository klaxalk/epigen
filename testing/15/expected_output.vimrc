" This test is designed to test activation of nested lines and blocks
" using the reduction mode (sequential)

" This line should stay commented

This line should stay uncommented

This line should become uncommented " EPIGEN_DEL_LINE_TEST

" EPIGEN_DEL_BLOCK_TEST {

This block should become uncommented
....

This bracket } should not brake it

" EPIGEN_DEL_BLOCK_TEST }

" EPIGEN_DEL_BLOCK_TEST {

This line should become uncomemmented

" EPIGEN_DEL_BLOCK_TEST2 {

This block should become uncommented
....

This bracket } should not brake it

this lineshould become completely uncommented " EPIGEN_DEL_LINE_TEST3

" EPIGEN_DEL_BLOCK_TEST2 }

" EPIGEN_DEL_BLOCK_TEST }

" EPIGEN_DEL_BLOCK_TEST {
this is a short block which will be uncomemmented
" EPIGEN_DEL_BLOCK_TEST }

" EPIGEN_DEL_BLOCK_TEST2 {
this line should become completely uncommented " EPIGEN_DEL_LINE_TEST
" EPIGEN_DEL_BLOCK_TEST2 }
