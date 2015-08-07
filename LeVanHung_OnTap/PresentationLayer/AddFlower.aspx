<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddFlower.aspx.cs" Inherits="LeVanHung_OnTap.PresentationLayer.AddFlower" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Lê Văn Hùng</title>
    <link href="Style.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div id="Content">
            <div id="AddFlower">
                <table width="400px">
                    <tr>
                        <td colspan="3" class="Title">Thêm hoa
                        </td>
                    </tr>
                    <tr>
                        <td>Chủ đề hoa
                        </td>
                        <td>
                            <asp:DropDownList runat="server" ID="ddlChuDe" Width="200px"/>
                        </td>
                    </tr>
                    <tr>
                        <td>Mã hoa
                        </td>
                        <td>
                            <asp:TextBox runat="server" ID="txtMaHoa" Width="200px"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator runat="server" ID="rfvMaHoa" ControlToValidate="txtMaHoa" ErrorMessage="!" Display="Dynamic" ForeColor="red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>Tên hoa
                        </td>
                        <td>
                            <asp:TextBox runat="server" ID="txtTenHoa" Width="200px"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator runat="server" ID="rfvTenHoa" ControlToValidate="txtTenHoa" ErrorMessage="!" Display="Dynamic" ForeColor="red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>Hình ảnh
                        </td>
                        <td>
                            <asp:FileUpload runat="server" ID="uploadFile" />
                        </td>
                        <td>
                            <asp:RequiredFieldValidator runat="server" ID="rfvHinhAnh" ControlToValidate="uploadFile" ErrorMessage="!" Display="Dynamic" ForeColor="red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>Giá bán
                        </td>
                        <td>
                            <asp:TextBox runat="server" ID="txtGiaBan" Width="200px" ></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator runat="server" ID="rfvGiaBan" ControlToValidate="txtGiaBan" ErrorMessage="!" Display="Dynamic" ForeColor="red"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator runat="server" ID="revGiaBan" ControlToValidate="txtGiaBan" ErrorMessage="!" ValidationExpression="[0-9]{1,}" Display="Dynamic" ForeColor="red"></asp:RegularExpressionValidator>

                        </td>
                    </tr>
                    <tr>
                        <td>Số lượng
                        </td>
                        <td>
                            <asp:TextBox runat="server" ID="txtSoLuong" Width="200px"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator runat="server" ID="rfvSoLuong" ControlToValidate="txtSoLuong" ErrorMessage="!" Display="Dynamic" ForeColor="red"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator runat="server" ID="revSoLuong" ControlToValidate="txtSoLuong" ErrorMessage="!" ValidationExpression="[0-9]{1,}" Display="Dynamic" ForeColor="red"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <asp:Label runat="server" ID="lblMsg" ForeColor="red"></asp:Label>
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <asp:Button runat="server" ID="btnAdd" Text="Thêm" OnClick="ThemClick" Width="150px" Height="30px"/>
                        </td>
                        <td></td>
                    </tr>
                </table>
            </div>

            <div id="ShowFlower">
                <asp:GridView runat="server" ID="grvHoa" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" Width="800px" AllowPaging="True" OnPageIndexChanging="grvHoa_PageIndexChanging" PageSize="4">
                    <Columns>
                        <asp:TemplateField HeaderText="STT">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text="<%# Container.DataItemIndex + 1 %>"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Hình ảnh">
                            <ItemTemplate>
                                <asp:Image ID="Image1" runat="server" Width="150px" Height="150px" ImageUrl='<%# "~/PresentationLayer/Images/Products/" + Eval("HinhAnh") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="TenHoa" HeaderText="Tên Hoa" />
                        <asp:BoundField DataField="GiaBan" HeaderText="Giá bán (vnd)" />
                        <asp:BoundField DataField="SoLuong" HeaderText="Số lượng" />
                        <asp:TemplateField HeaderText="Loại hoa">
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("LoaiChuDe") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                    <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                    <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                    <RowStyle BackColor="White" ForeColor="#003399" />
                    <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                    <SortedAscendingCellStyle BackColor="#EDF6F6" />
                    <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                    <SortedDescendingCellStyle BackColor="#D6DFDF" />
                    <SortedDescendingHeaderStyle BackColor="#002876" />
                </asp:GridView>
            </div>
        </div>
    </form>
</body>
</html>
