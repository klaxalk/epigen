" This test aims to test uncomming with "or"-like behavior

" This line should stay commented

This line should stay uncommented

This line should become uncommented " EPIGEN_DEL_LINE_TEST1 EPIGEN_DEL_LINE_TEST2

This line should become uncommented " EPIGEN_DEL_LINE_TEST2 EPIGEN_DEL_LINE_TEST1

This line should become uncommented " EPIGEN_DEL_LINE_TEST1

" This line should stay commented " EPIGEN_DEL_LINE_TEST2

" EPIGEN_DEL_BLOCK_TEST1 {

This block should become uncommented

" EPIGEN_DEL_BLOCK_TEST1 }

" EPIGEN_DEL_BLOCK_TEST2 ACTIVE {

This block should stay uncommented

" EPIGEN_DEL_BLOCK_TEST2 }

" EPIGEN_DEL_BLOCK_TEST1 EPIGEN_DEL_BLOCK_TEST2 {

This block should become uncommented

" EPIGEN_DEL_BLOCK_TEST1 EPIGEN_DEL_BLOCK_TEST2 }

" EPIGEN_DEL_BLOCK_TEST2 EPIGEN_DEL_BLOCK_TEST1 {

This block should become uncommented

" EPIGEN_DEL_BLOCK_TEST2 EPIGEN_DEL_BLOCK_TEST1 }

" EPIGEN_DEL_BLOCK_TEST2 EPIGEN_DEL_BLOCK_TEST1 {

This block should become uncommented

" EPIGEN_DEL_BLOCK_TEST1 EPIGEN_DEL_BLOCK_TEST2 }
