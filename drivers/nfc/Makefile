#
# Makefile for nfc devices
#

obj-$(CONFIG_PN544_NFC)		+= pn544.o
obj-$(CONFIG_SEC_NFC_SENN3AB)   += secnfc/
obj-$(CONFIG_PN544_HCI_NFC)	+= pn544_hci.o
obj-$(CONFIG_PN544_HCI_NFC)	+= pn544/
obj-$(CONFIG_NFC_PN544)		+= pn544/
obj-$(CONFIG_NFC_MICROREAD)	+= microread/
obj-$(CONFIG_NFC_PN533)		+= pn533.o
obj-$(CONFIG_NFC_WILINK)	+= nfcwilink.o
obj-$(CONFIG_NFC_QNCI)		+= nfc-nci.o
obj-$(CONFIG_NFC_MEI_PHY)	+= mei_phy.o
obj-$(CONFIG_NFC_SIM)		+= nfcsim.o

ccflags-$(CONFIG_NFC_DEBUG) := -DDEBUG
