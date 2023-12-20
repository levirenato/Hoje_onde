import { ApiProperty } from "@nestjs/swagger";

import { IsDateString, IsNumber, IsString} from 'class-validator';
export class CreateUserDto {
    @ApiProperty()
    @IsString()
    nome : string;
    @ApiProperty()
    @IsString()
    sobrenome: string;
    @ApiProperty()
    @IsString()
    user_img: string;
    @ApiProperty({type: Date})
    @IsDateString()
    data_nasc: Date;
    @ApiProperty()
    @IsString()
    email: string;
    @ApiProperty()
    @IsString()
    senha: string;
    @ApiProperty()
    @IsNumber()
    nivel_usuario: number;
}
