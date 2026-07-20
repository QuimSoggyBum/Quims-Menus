// Quims Loom Table Menu
if (${input$ENTITY} instanceof ServerPlayer player) {
    final String qm_title = ${input$TEXT};

    player.openMenu(new MenuProvider() {
        @Override
        public Component getDisplayName() {
            return Component.literal(qm_title);
        }

        @Override
        public AbstractContainerMenu createMenu(int id, Inventory inv, Player playerEntity) {
            return new LoomMenu(
                id,
                inv
            ) {
                @Override
                public boolean stillValid(Player p) {
                    return true;
                }
            };
        }
    });
}
