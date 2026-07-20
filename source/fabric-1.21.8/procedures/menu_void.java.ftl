// Quims Void Items

LevelAccessor void_lvl = world;

BlockPos void_qmp_Pos = BlockPos.containing(${input$X}, ${input$Y}, ${input$Z});

if (void_lvl.getBlockEntity(void_qmp_Pos) instanceof Container voidContainer) {

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

                for (int clearSlot = 0; clearSlot < voidContainer.getContainerSize(); clearSlot++) {
                    voidContainer.setItem(clearSlot, ItemStack.EMPTY);
                }

                voidContainer.setChanged();
                break;
            }
        }
    }
}


/*
LevelAccessor void_lvl = world;

BlockPos void_qmp_Pos = BlockPos.containing(${input$X}, ${input$Y}, ${input$Z});

boolean void_removedItem = false;

if (void_lvl.getBlockEntity(void_qmp_Pos) instanceof Container container) {

    for (int slot = 0; slot < container.getContainerSize(); slot++) {

        if (void_removedItem) {
            break;
        }

        ItemStack stack = container.getItem(slot);

        if (!stack.isEmpty()) {

            stack.shrink(1);

            container.setItem(slot, stack);

            container.setChanged();

            void_removedItem = true;
        }
    }
}
*/
