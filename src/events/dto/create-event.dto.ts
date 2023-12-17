import { IsDateString, IsNumber, IsString } from 'class-validator';

export class CreateEventDto {
  @IsString()
  nome_evento: string;

  @IsString()
  endereco_evento: string;

  @IsString()
  descricao: string;

  @IsNumber()
  status_evento: number;

  @IsDateString()
  data_evento: Date;

  @IsNumber()
  curtida: number;

  @IsString()
  imagem_evento: string;

  @IsNumber()
  id_usuario: number;

  @IsNumber()
  id_categoria: number;
}
