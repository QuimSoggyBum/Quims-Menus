// Quims Grindstone Table Menu
if (${input$ENTITY} instanceof ServerPlayer player && ${input$ENTITY}.level() instanceof Level lvl) {
    BlockPos qmp_Pos = player.blockPosition();
    final String qm_title = ${input$TEXT};

    player.openMenu(new MenuProvider() {
        @Override
        public Component getDisplayName() {
            return Component.literal(qm_title);
        }

        @Override
        public AbstractContainerMenu createMenu(int id, Inventory inv, Player playerEntity) {
			return new GrindstoneMenu(
				id,
				inv,
				ContainerLevelAccess.create(lvl, qmp_Pos)
			) {
				@Override
				public boolean stillValid(Player p) {
					return true;
				}
			};
        }
    });
}
