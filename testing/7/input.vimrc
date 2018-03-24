" This test is designed to test complete back and forth commenting in the
" additive mode thus the output should be the same as the input
" the -u option will be used to uncomment the stuff

" commented line

uncommented line

" inactive line " EPIGEN_LINE_TEST

" EPIGEN_BLOCK_TEST {

" block content
" ....

" This bracket } should not brake it

" EPIGEN_BLOCK_TEST }

" EPIGEN_BLOCK_TEST {

" line

" " EPIGEN_BLOCK_TEST2 {

" " content if a nested block
" " ....

" " This bracket } should not brake it

" " " commented lin in a block in a block " EPIGEN_LINE_TEST3

" " EPIGEN_BLOCK_TEST2 }

" EPIGEN_BLOCK_TEST }

" EPIGEN_BLOCK_TEST {
" short block
" EPIGEN_BLOCK_TEST }

" EPIGEN_BLOCK_TEST2 {
" " short block with a line " EPIGEN_LINE_TEST
" EPIGEN_BLOCK_TEST2 }
