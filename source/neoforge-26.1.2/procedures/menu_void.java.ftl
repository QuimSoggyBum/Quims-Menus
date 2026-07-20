// Quims Void Items

LevelAccessor void_lvl = world;

BlockPos void_qmp_Pos = BlockPos.containing(${input$X}, ${input$Y}, ${input$Z});

Container voidContainer = null;

BlockState voidState = void_lvl.getBlockState(void_qmp_Pos);

if (void_lvl instanceof Level level &&
    voidState.getBlock() instanceof ChestBlock chestBlock) {

    voidContainer = ChestBlock.getContainer(
        chestBlock,
        voidState,
        level,
        void_qmp_Pos,
        true
    );

}

if (voidContainer == null &&
    void_lvl.getBlockEntity(void_qmp_Pos) instanceof Container container) {

    voidContainer = container;

}

if (voidContainer != null) {

    for (int slot = 0; slot < voidContainer.getContainerSize(); slot++) {

        ItemStack stack = voidContainer.getItem(slot);

        if (!stack.isEmpty()) {

            if ("SINGLE".equals("${field$AMOUNT}")) {

                stack.shrink(1);

                voidContainer.setItem(slot, stack);

                voidContainer.setChanged();

                break;

            } else if ("SLOT".equals("${field$AMOUNT}")) {

                voidContainer.setItem(slot, ItemStack.EMPTY);

                voidContainer.setChanged();

                break;

            } else if ("INVENTORY".equals("${field$AMOUNT}")) {

                for (int clearSlot = 0;
                     clearSlot < voidContainer.getContainerSize();
                     clearSlot++) {

                    voidContainer.setItem(
                        clearSlot,
                        ItemStack.EMPTY
                    );

                }

                voidContainer.setChanged();

                break;

            }

        }

    }

}
