" This test is designed to test mass deactivation of
" lines and blocks

" This line should stay commented

This line should stay uncommented

" This line should become commented " EPIGEN_LINE_TEST

This line should stay uncommented " EPIGEN_LINE_TEST

" EPIGEN_BLOCK_TEST {

" This block should become commented
" ....

" This bracket } should not brake it

" EPIGEN_BLOCK_TEST }


" EPIGEN_BLOCK_TEST {

" This line should become commented as a part of the surrounding block

" " EPIGEN_BLOCK_TEST2 {

" " This block should become commented even more
" " ....

" " This bracket } should not brake it

" " EPIGEN_BLOCK_TEST2 }

" EPIGEN_BLOCK_TEST }

" EPIGEN_BLOCK_TEST {
" this is a short block which will be commented
" EPIGEN_BLOCK_TEST }
