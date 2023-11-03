<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<html>
			<head></head>
			<body>
				<h1>Listes des comptes</h1>
				<table border="1">
					<tr>
						<th>Code</th>
						<th>Solde</th>
						<th>Date de Creation</th>
					</tr>
					<xsl:for-each select="Banqueservice/getComptes">
						<tr>
							<td>
								<xsl:value-of select="code" />
							</td>
							<td>
								<xsl:value-of select="solde" />
							</td>
							<td>
								<xsl:value-of select="datecreation" />
							</td>
						</tr>
					</xsl:for-each>
					</table>
					<xsl:variable name="totalSolde"
						select="sum(BanqueService/getComptes/solde)" />
					<p>
						Total des soldes :
						<xsl:value-of select="totalSolde" />
					</p>
					<h1>get comptes >2000</h1>
					<table border="1">
						<tr>
							<th>Code</th>
							<th>Solde</th>
							<th>Date de création</th>
						</tr>
						<xsl:for-each 
						select="BanqueService/getComptes[substring(datecreation,1,4) > 2000]">
							<tr>
								<td>
									<xsl:value-of select="code" />
								</td>
								<td>
									<xsl:value-of select="solde" />
								</td>
								<td>
									<xsl:value-of select="datecreation" />
								</td>
							</tr>
						</xsl:for-each>

					</table>

					<xsl:variable name="totalSoldeFiltré"
						select="sum(/BanqueService/getComptes[substring(datecreation,1,4) > 2000]/solde)" />
					<p>
						Total des soldes Filtrés :
						<xsl:value-of select="$totalSoldeFiltré" />
					</p>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>