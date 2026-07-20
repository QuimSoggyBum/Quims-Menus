// Quims Hopper Menu
if (${input$ENTITY} instanceof ServerPlayer player) {
    BlockPos qmp_Pos = BlockPos.containing(${input$X}, ${input$Y}, ${input$Z});
    Level lvl = player.level();
    final String qm_title = ${input$TEXT};

    if (lvl.getBlockEntity(qmp_Pos) instanceof Container hopperContainer) {

        player.openMenu(new MenuProvider() {

            @Override
            public Component getDisplayName() {
                return Component.literal(qm_title);
            }

            @Override
            public AbstractContainerMenu createMenu(int id, Inventory inv, Player playerEntity) {
                return new HopperMenu(
                    id,
                    inv,
                    hopperContainer
                ) {
                    @Override
                    public boolean stillValid(Player p) {
                        return true;
                    }
                };
            }
        });
    }
}

