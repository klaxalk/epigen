" This test aims to test uncomming with "or"-like behavior

" This line should stay commented

This line should stay uncommented

This line should become uncommented " EPIGEN_ADD_LINE_TEST1 EPIGEN_ADD_LINE_TEST2 ACTIVE

This line should become uncommented " EPIGEN_ADD_LINE_TEST2 EPIGEN_ADD_LINE_TEST1 ACTIVE

This line should become uncommented " EPIGEN_ADD_LINE_TEST1 ACTIVE

" This line should stay commented " EPIGEN_ADD_LINE_TEST2

" EPIGEN_ADD_BLOCK_TEST1 ACTIVE {

This block should become uncommented

" EPIGEN_ADD_BLOCK_TEST1 }

" EPIGEN_ADD_BLOCK_TEST2 {

" This block should stay commented

" EPIGEN_ADD_BLOCK_TEST2 }

" EPIGEN_ADD_BLOCK_TEST1 EPIGEN_ADD_BLOCK_TEST2 ACTIVE {

This block should become uncommented

" EPIGEN_ADD_BLOCK_TEST1 EPIGEN_ADD_BLOCK_TEST2 }

" EPIGEN_ADD_BLOCK_TEST2 EPIGEN_ADD_BLOCK_TEST1 ACTIVE {

This block should become uncommented

" EPIGEN_ADD_BLOCK_TEST2 EPIGEN_ADD_BLOCK_TEST1 }

" EPIGEN_ADD_BLOCK_TEST2 EPIGEN_ADD_BLOCK_TEST1 ACTIVE {

This block should become uncommented

" EPIGEN_ADD_BLOCK_TEST1 EPIGEN_ADD_BLOCK_TEST2 }
